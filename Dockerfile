FROM ubuntu:20.04

MAINTAINER Javad Razavian, Version 0.1

ARG VERSION

# Setting up the system
RUN apt-get update && \ 
    apt-get install -y --no-install-recommends \
        ca-certificates \
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
        libfontconfig1 \
        curl && \
    curl https://desktop-download.mendeley.com/download/apt/pool/main/m/mendeleydesktop/mendeleydesktop_${VERSION}-stable_amd64.deb \
         --output /tmp/mendeleydesktop.deb && \
    dpkg -i /tmp/mendeleydesktop.deb && \
    apt-get autoremove curl ca-certificates -y && \
    apt-get -qqy install -f && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    mkdir -p /usr/share/X11/xkb && \
    mkdir -p /tmp/runtime-root

ENV QT_XKB_CONFIG_ROOT=/usr/share/X11/xkb
ENV DISPLAY :0

CMD ["mendeleydesktop"]
