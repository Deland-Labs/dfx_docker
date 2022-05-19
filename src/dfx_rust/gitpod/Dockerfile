# [Choice] Debian OS version (use bullseye on local arm64/Apple Silicon): buster, bullseye
ARG VARIANT="sudo"
FROM gitpod/workspace-rust
ARG DFX_VERSION
ARG NODE_VERSION=16

COPY fix_gitpod_path.sh ~

# [Optional] Uncomment this section to install additional packages.
RUN sudo apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && sudo apt-get -y install \
    liblmdb-dev \
    # cpp \
    # gcc-8-multilib \
    # libgcc-8-dev \
    gcc \
    # g++ \
    build-essential \
    gdb \
    python3-pip \
    make \
    cmake \
    pkg-config \
    gcc-multilib \
    && sudo apt-get clean
RUN pip3 install pipenv && \
    pip3 install pre-commit
SHELL ["/bin/bash", "-c"]
RUN rustup toolchain install stable && \
    rustup target add wasm32-unknown-unknown --toolchain stable
RUN curl -fsSL https://sdk.dfinity.org/install.sh > install.sh && \
    chmod +x ./install.sh && \
    DFX_VERSION=$DFX_VERSION ./install.sh && \
    rm ./install.sh
    
RUN curl -fsSL https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | PROFILE=/dev/null bash \
    && bash -c ". .nvm/nvm.sh \
        && nvm install v${NODE_VERSION} \
        && nvm alias default v${NODE_VERSION}" \

# COPY config.toml /usr/local/cargo/
RUN cargo install ic-cdk-optimizer && \
    cargo install cargo-audit && \
    cargo install cargo-nextest && \
    cargo install cargo-llvm-cov 
    