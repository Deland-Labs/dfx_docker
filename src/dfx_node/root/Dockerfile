# [Choice] Debian OS version (use bullseye on local arm64/Apple Silicon): buster, bullseye
ARG VARIANT="sudo"
FROM mcr.microsoft.com/vscode/devcontainers/typescript-node:16-${VARIANT}
ARG DFX_VERSION="0.9.3"

# [Optional] Uncomment this section to install additional packages.
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
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
    && apt-get clean
RUN curl -fsSL https://sdk.dfinity.org/install.sh > install.sh && \
    chmod +x install.sh && \
    DFX_VERSION=$DFX_VERSION  ./install.sh && \
    rm install.sh
RUN npm install -g yarn typescript ts-node
    