# [Choice] Debian OS version (use bullseye on local arm64/Apple Silicon): buster, bullseye
ARG OS_VERSION="sudo"
FROM gitpod/workspace-rust
ARG DFX_VERSION
ARG NODE_VERSION=16
ARG RUST_TOOLCHAIN_VERSION=1.63.0

COPY fix_gitpod_path.sh .

# [Optional] Uncomment this section to install additional packages.
COPY install-base-ubuntu.sh .
RUN sudo ./install-base-ubuntu.sh
RUN pip3 install pipenv && \
    pip3 install pre-commit
SHELL ["/bin/bash", "-c"]
RUN rustup toolchain install $RUST_TOOLCHAIN_VERSION && \
    rustup target add wasm32-unknown-unknown --toolchain $RUST_TOOLCHAIN_VERSION
RUN curl -fsSL https://sdk.dfinity.org/install.sh > install.sh && \
    chmod +x ./install.sh && \
    DFX_VERSION=$DFX_VERSION ./install.sh && \
    rm ./install.sh
    
RUN curl -fsSL https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | PROFILE=/dev/null bash \
    && bash -c ". .nvm/nvm.sh \
        && nvm install v${NODE_VERSION} \
        && nvm alias default v${NODE_VERSION}" \

# COPY config.toml /usr/local/cargo/
RUN mkdir -p /home/gitpod/.cargo/bin/ 
COPY cargo-cli/* /home/gitpod/.cargo/bin/