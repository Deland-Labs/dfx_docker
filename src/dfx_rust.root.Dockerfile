# [Choice] Debian OS version (use bullseye on local arm64/Apple Silicon): buster, bullseye
ARG OS_VERSION="sudo"
FROM mcr.microsoft.com/vscode/devcontainers/rust:1-${OS_VERSION}
ARG DFX_VERSION
ARG NODE_VERSION=16
ARG RUST_TOOLCHAIN_VERSION=1.63.0

# [Optional] Uncomment this section to install additional packages.
COPY install-base-debian.sh .
RUN ./install-base-debian.sh
RUN pip3 install pipenv && \
    pip3 install pre-commit
RUN rustup toolchain install ${RUST_TOOLCHAIN_VERSION} && \
    rustup target add wasm32-unknown-unknown --toolchain ${RUST_TOOLCHAIN_VERSION}
RUN curl -fsSL https://sdk.dfinity.org/install.sh > install.sh && \
    chmod +x install.sh && \
    DFX_VERSION=$DFX_VERSION ./install.sh && \
    rm install.sh

RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash && \
    . ~/.bashrc && \
    nvm install v${NODE_VERSION} && \
    nvm alias default v${NODE_VERSION}
    
# COPY config.toml /usr/local/cargo/
COPY cargo-cli/* /usr/local/cargo/bin/
