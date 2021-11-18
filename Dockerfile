FROM ubuntu:20.04

MAINTAINER Javad Razavian, Version 0.1

ARG VERSION


COPY /tmp/mendeleydesktop_${VERSION}-stable_amd64.deb /tmp/mendeleydesktop.deb

# Setting up the system
RUN apt-get update && \ 
    apt-get install -y --no-install-recommends \
        python \
        gconf2 \
        desktop-file-utils \
        libgl1-mesa-glx \
        libegl1-mesa \
        libnss3 \
        libxdamage1 \
        libxcomposite1 \
        libxi6 \
        libxtst6 \
        libxrandr2 \
        libasound2 \
        libxcursor1 \
        libfreetype6 \
        libfontconfig1 && \
    dpkg -i /tmp/mendeleydesktop.deb && \
    apt-get -qqy install -f && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    mkdir -p /usr/share/X11/xkb && \
    mkdir -p /tmp/runtime-root

ENV QT_XKB_CONFIG_ROOT=/usr/share/X11/xkb
ENV DISPLAY :0

CMD ["mendeleydesktop"]
