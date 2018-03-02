FROM ubuntu:16.04

MAINTAINER Obscuritylabs
LABEL version="1.0"
LABEL description="Dockerfile base for JTR Jumbo."

# docker hardcoded sh...
SHELL ["/bin/bash", "-c"]

# env setup
ENV DEBIAN_FRONTEND=noninteractive

# install proper tools
RUN apt-get update && \
    apt-get install -yq wget curl net-tools sudo

# install and build john
RUN apt-get install -yq \
    build-essential \
    libssl-dev \
    git \
    yasm \
    libgmp-dev \
    libpcap-dev \
    pkg-config \
    libbz2-dev \
    nvidia-opencl-dev \
    libopenmpi-dev \
    openmpi-bin \
    cmake \
    bison \
    flex \
    libicu-dev

RUN cd /opt && git clone --recursive https://github.com/teeshop/rexgen.git && \
    cd rexgen && \
    ./install.sh

RUN cd /opt && git clone git://github.com/magnumripper/JohnTheRipper -b bleeding-jumbo john && \
    cd /opt/john/src && ./configure && make -s clean && make -sj4

WORKDIR /opt/john/run

ENTRYPOINT ["./john"]
