# [Choice] Debian OS version (use bullseye on local arm64/Apple Silicon): buster, bullseye
ARG VARIANT="sudo"
FROM mcr.microsoft.com/vscode/devcontainers/rust:1-${VARIANT}
ARG DFX_VERSION
ARG NODE_VERSION=16

# [Optional] Uncomment this section to install additional packages.
COPY install-base-debian.sh .
RUN ./install-base-debian.sh
RUN pip3 install pipenv && \
    pip3 install pre-commit
RUN rustup toolchain install stable && \
    rustup target add wasm32-unknown-unknown --toolchain stable
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
