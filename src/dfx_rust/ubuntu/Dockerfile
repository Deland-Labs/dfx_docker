ARG CODE_VERSION=latest
ARG DOCKER_REGISTERY=docker.io
FROM ${DOCKER_REGISTERY}/kentsday/kentsday-ubuntu-dev:${CODE_VERSION}

RUN curl -fsSL https://sdk.dfinity.org/install.sh | sh
RUN curl -o rustup.sh --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs \
    && chmod +x rustup.sh \
    && ./rustup.sh -y --profile default -t wasm32-unknown-unknown \
    && . /root/.cargo/env \
    && cargo install ic-cdk-optimizer

RUN ( \
    echo 'LogLevel DEBUG2'; \
    echo 'PermitRootLogin yes'; \
    echo 'PasswordAuthentication yes'; \
    echo 'Subsystem sftp /usr/lib/openssh/sftp-server'; \
    ) > /etc/ssh/sshd_config_test_clion \
    && mkdir /run/sshd

RUN yes root | passwd root

CMD ["/usr/sbin/sshd", "-D", "-e", "-f", "/etc/ssh/sshd_config_test_clion"]
