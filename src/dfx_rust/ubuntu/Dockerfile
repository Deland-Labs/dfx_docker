ARG CODE_VERSION=latest
ARG DOCKER_REGISTERY=docker.io
ARG RUST_VERSION=1.51.0
FROM ${DOCKER_REGISTERY}/kentsday/kentsday-ubuntu-dev:${CODE_VERSION}

EXPOSE 8000
EXPOSE 22

# refer to https://github.com/dfinity/internet-identity/blob/main/Dockerfile
# Install Rust and Cargo in /opt
ENV RUSTUP_HOME=/opt/rustup \
    CARGO_HOME=/opt/cargo \
    PATH=/opt/cargo/bin:$PATH

RUN curl -fsSL https://sdk.dfinity.org/install.sh | sh

RUN curl -o rustup.sh --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs \
    && chmod +x rustup.sh \
    && ./rustup.sh -y --profile default --no-modify-path \
    && rustup target add wasm32-unknown-unknown

ENV CARGO_HOME=/cargo \
    CARGO_TARGET_DIR=/cargo_target \
    PATH=/cargo/bin:$PATH

# Install IC CDK optimizer
# (keep version in sync with src/internet_identity/build.sh)
RUN cargo install ic-cdk-optimizer

RUN ( \
    echo 'LogLevel DEBUG2'; \
    echo 'PermitRootLogin yes'; \
    echo 'PasswordAuthentication yes'; \
    echo 'Subsystem sftp /usr/lib/openssh/sftp-server'; \
    ) > /etc/ssh/sshd_config_test_clion \
    && mkdir /run/sshd

RUN yes root | passwd root

CMD ["/usr/sbin/sshd", "-D", "-e", "-f", "/etc/ssh/sshd_config_test_clion"]
