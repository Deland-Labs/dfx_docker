# [Choice] Debian OS version (use bullseye on local arm64/Apple Silicon): buster, bullseye
ARG VARIANT="sudo"
FROM mcr.microsoft.com/vscode/devcontainers/rust:1-${VARIANT}

# [Optional] Uncomment this section to install additional packages.
# set apt-get mirrors to qinghua
RUN echo "deb http://mirrors.tuna.tsinghua.edu.cn/debian/ buster main contrib non-free" > /etc/apt/sources.list
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
RUN curl -fsSL https://sdk.dfinity.org/install.sh | sh
# COPY config.toml /usr/local/cargo/
RUN cargo install ic-cdk-optimizer
