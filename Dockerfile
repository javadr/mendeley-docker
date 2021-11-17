FROM ubuntu:20.04

MAINTAINER Javad Razavian, Version 0.1

ARG HOST_USER
ARG HOST_UID
ARG HOST_GID
ARG VERSION
ARG FILENAME=mendeleydesktop_${VERSION}-stable_amd64.deb
ARG URL=https://desktop-download.mendeley.com/download/apt/pool/main/m/mendeleydesktop/${FILENAME}
ARG XDG_DIR=/tmp/runtime-root

# Setting up the system
ADD entrypoint.sh /

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
        bindfs sudo \
        curl 
RUN curl ${URL} --output /tmp/mendeleydesktop.deb && \
    dpkg -i /tmp/mendeleydesktop.deb && \
    apt-get -qqy install -f && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* 
RUN mkdir -p /usr/share/X11/xkb && \
    mkdir -p $XDG_DIR 
RUN groupadd -g $HOST_GID $HOST_USER && \
    useradd --no-create-home --no-log-init -u $HOST_UID -g $HOST_GID $HOST_USER
#    chown -R "$HOST_UID:$HOST_GID" /root
#echo '%$HOST_USER ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers && \


ENV QT_XKB_CONFIG_ROOT=/usr/share/X11/xkb
ENV DISPLAY :0

RUN chmod +x entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
#CMD ["mendeleydesktop", "--sync-then-quit"]
