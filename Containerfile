# FROM ubuntu:20.04
FROM ros:noetic

ARG TARGETARCH
ARG SPINNAKER_VERSION=4.2.0.21

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        iputils-ping \
        libavcodec58 \
        libavformat58 \
        libgomp1 \
        libqt5opengl5 \
        libswscale5 \
        libusb-1.0-0 \
        lsb-release \
        qt5-default \
        wget && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
ENV DEBIAN_FRONTEND=

COPY spinnaker-$SPINNAKER_VERSION-$TARGETARCH-20.04-pkg.tar.gz /tmp/spinnaker.tar.gz

RUN echo "libspinnaker libspinnaker/accepted-flir-eula boolean true" | debconf-set-selections 

ENV DEBIAN_FRONTEND=noninteractive
RUN tar -xzf /tmp/spinnaker.tar.gz -C /tmp && \
    cd /tmp/spinnaker-$SPINNAKER_VERSION-$TARGETARCH && \
    dpkg -i libgentl_*.deb && \
    dpkg -i libspinnaker_*.deb && \
    dpkg -i libspinnaker-dev_*.deb && \
    dpkg -i libspinnaker-c_*.deb && \
    dpkg -i libspinnaker-c-dev_*.deb && \
    dpkg -i libspinvideo_*.deb && \
    dpkg -i libspinvideo-dev_*.deb && \
    dpkg -i libspinvideo-c_*.deb && \
    dpkg -i libspinvideo-c-dev_*.deb && \
    dpkg -i spinview-qt_*.deb && \
    dpkg -i spinview-qt-dev_*.deb && \
    dpkg -i spinupdate_*.deb && \
    dpkg -i spinupdate-dev_*.deb && \
    dpkg -i spinnaker_*.deb && \
    dpkg -i spinnaker-doc_*.deb && \
    rm /tmp/spinnaker.tar.gz && \
    rm -rf /tmp/spinnaker-$SPINNAKER_VERSION-$TARGETARCH
ENV DEBIAN_FRONTEND=

ENV SPINNAKER_GENTL64_CTI=/opt/spinnaker/lib/spinnaker-gentl/Spinnaker_GenTL.cti

ENTRYPOINT ["/opt/spinnaker/bin/spinview"]
