# [Choice] Debian OS version (use bullseye on local arm64/Apple Silicon): buster, bullseye
FROM gitpod/workspace-node-lts
ARG DFX_VERSION="0.9.3"

COPY fix_gitpod_path.sh .

# [Optional] Uncomment this section to install additional packages.
COPY install-base-ubuntu.sh .
RUN sudo ./install-base-ubuntu.sh

RUN curl -fsSL https://internetcomputer.org/install.sh > install.sh && \
    chmod +x install.sh && \
    DFX_VERSION=$DFX_VERSION  ./install.sh && \
    rm install.sh