FROM ubuntu:focal

RUN DEBIAN_FRONTEND="noninteractive" apt-get update && apt-get -y install tzdata
RUN apt-get update \
    && apt-get install -y ssh \
    build-essential \
    gcc-multilib \
    gcc \
    g++ \
    gdb \
    clang \
    make \
    ninja-build \
    cmake \
    autoconf \
    automake \
    locales-all \
    dos2unix \
    rsync \
    tar \
    python \
    curl \
    nodejs \
    npm \
    pkg-config \
    && apt-get clean