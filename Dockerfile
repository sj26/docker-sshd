FROM ubuntu

RUN apt-get update && \
    apt-get install --assume-yes --no-install-recommends openssh-server && \
    rm -rf /var/lib/apt/lists/* && \
    mkdir /root/.ssh/ && \
    mkdir /run/sshd

ENV AUTHORIZED_KEYS ""

ENTRYPOINT ["/bin/bash", "-c", "if [[ -n \"$AUTHORIZED_KEYS\" ]]; then echo \"$AUTHORIZED_KEYS\" > /root/.ssh/authorized_keys; fi; exec \"$0\" \"$@\""]

CMD ["/usr/sbin/sshd", "-D"]
