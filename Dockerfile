FROM ubuntu:18.04
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
    apt-get -y install wget gnupg apt-transport-https && \
    wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.asc.gpg && \
    mv microsoft.asc.gpg /etc/apt/trusted.gpg.d/ && \
    wget -q https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb && \
    mv packages-microsoft-prod.deb /etc/apt/sources.list.d/microsoft-packages-microsoft-prod.deb && \
    dpkg -i /etc/apt/sources.list.d/microsoft-packages-microsoft-prod.deb && \
    apt-get update && \
    apt-get install -y msopenjdk-11

ENV JAVA_HOME /usr/lib/jvm/msopenjdk-11-amd64
ENV PATH $JAVA_HOME/bin:$PATH

RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/*
