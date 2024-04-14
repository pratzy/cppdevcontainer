FROM ubuntu:22.04
LABEL Description="Build environment"

ENV HOME /root

SHELL ["/bin/bash", "-c"]

RUN apt-get update && apt-get -y --no-install-recommends install \
    build-essential \
    clang \
    cmake \
    gdb \
    wget

RUN  apt update && apt install -y -V ca-certificates lsb-release wget \
    && wget https://apache.jfrog.io/artifactory/arrow/$(lsb_release --id --short | tr 'A-Z' 'a-z')/apache-arrow-apt-source-latest-$(lsb_release --codename --short).deb \
    && apt install -y -V ./apache-arrow-apt-source-latest-$(lsb_release --codename --short).deb \
    && apt update \
    && apt install -y -V libarrow-dev  \
    && apt install -y -V libarrow-glib-dev \ 
    && apt install -y -V libarrow-dataset-dev \ 
    && apt install -y -V libarrow-dataset-glib-dev \ 
    && apt install -y -V libparquet-dev \
    && apt install -y -V libparquet-glib-dev 
