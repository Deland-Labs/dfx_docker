# [Choice] Debian OS version (use bullseye on local arm64/Apple Silicon): buster, bullseye
ARG VARIANT="sudo"
ARG DFX_VERSION="0.9.0"
FROM mcr.microsoft.com/vscode/devcontainers/rust:1-${VARIANT}

# [Optional] Uncomment this section to install additional packages.
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install \
    # cpp \
    # gcc-8-multilib \
    # libgcc-8-dev \
    # gcc \
    # g++ \
    build-essential \
    # gdb \
    python3-pip \
    make \
    cmake \
    pkg-config \
    # gcc-multilib \
    && apt-get clean
RUN pip3 install pipenv
RUN rustup toolchain install stable && \
    rustup target add wasm32-unknown-unknown --toolchain stable
RUN DFX_VERSION=${DFX_VERSION} sh -ci "$(curl -fsSL https://sdk.dfinity.org/install.sh)"
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash && \
    . ~/.bashrc && \
    nvm install 16 && \
    npm install -g typescript && \
    npm install -g ts-node
    
# COPY config.toml /usr/local/cargo/
RUN cargo install ic-cdk-optimizer
