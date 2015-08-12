FROM ubuntu:15.04
MAINTAINER Markus Kosmal <code@m-ko-x.de>

ENV USER share
ENV PASS noway
ENV USER_UID 1000

RUN apt-get update -y && \
    apt-get install -yqq openssh-server mcrypt && \
    mkdir /var/run/sshd && chmod 0755 /var/run/sshd

ADD assets/bootstrap.sh /usr/local/bin/bootstrap.sh
ADD assets/sshd_config /etc/ssh/sshd_config

VOLUME ["/data"]
EXPOSE 22

ENTRYPOINT ["/bin/bash", "/usr/local/bin/bootstrap.sh"]