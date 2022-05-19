# [Choice] Debian OS version (use bullseye on local arm64/Apple Silicon): buster, bullseye
FROM gitpod/workspace-node-lts
ARG DFX_VERSION="0.9.3"

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

RUN curl -fsSL https://sdk.dfinity.org/install.sh > install.sh && \
    chmod +x install.sh && \
    DFX_VERSION=$DFX_VERSION  ./install.sh && \
    rm install.sh
RUN npm install -g yarn typescript ts-node
