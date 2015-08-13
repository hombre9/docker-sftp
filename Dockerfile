FROM ubuntu:15.04
MAINTAINER Markus Kosmal <code@m-ko-x.de>

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get -y install openssh-server && \
    rm -rf /var/lib/apt/lists/*

# sshd needs this directory to run
RUN mkdir -p /var/run/sshd

COPY assets/bootstrap /
COPY assets/sshd_config /etc/ssh/sshd_config

EXPOSE 22
EXPOSE 80
EXPOSE 8080

ENTRYPOINT ["/bootstrap"]