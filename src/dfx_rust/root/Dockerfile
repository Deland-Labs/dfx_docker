# [Choice] Debian OS version (use bullseye on local arm64/Apple Silicon): buster, bullseye
ARG VARIANT="sudo"
FROM mcr.microsoft.com/vscode/devcontainers/rust:1-${VARIANT}
ARG DFX_VERSION

# [Optional] Uncomment this section to install additional packages.
RUN curl -fsSL https://deb.nodesource.com/setup_16.x | bash - && \
    apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install \
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
    nodejs \
    && apt-get clean
RUN pip3 install pipenv && \
    pip3 install pre-commit
RUN rustup toolchain install stable && \
    rustup target add wasm32-unknown-unknown --toolchain stable
RUN curl -fsSL https://sdk.dfinity.org/install.sh > install.sh && \
    chmod +x install.sh && \
    DFX_VERSION=$DFX_VERSION ./install.sh && \
    rm install.sh
    
# COPY config.toml /usr/local/cargo/
RUN cargo install ic-cdk-optimizer && \
    cargo install cargo-audit && \
    cargo install cargo-nextest && \
    cargo install cargo-llvm-cov 