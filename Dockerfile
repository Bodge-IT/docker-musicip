FROM debian:jessie
MAINTAINER Justifiably <justifiably@ymail.com>

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -yq libc6-i386 vim-tiny && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

ENV GOSU_VERSION 1.10
RUN set -x \
    && apt-get update && apt-get install -y --no-install-recommends ca-certificates wget && rm -rf /var/lib/apt/lists/* \
    && wget -O /usr/local/bin/gosu "https://github.com/tianon/gosu/releases/download/$GOSU_VERSION/gosu-$(dpkg --print-architecture)" \
    && wget -O /usr/local/bin/gosu.asc "https://github.com/tianon/gosu/releases/download/$GOSU_VERSION/gosu-$(dpkg --print-architecture).asc" \
    && export GNUPGHOME="$(mktemp -d)" \
    && gpg --keyserver ha.pool.sks-keyservers.net --recv-keys B42F6819007F00F88E364FD4036A9C25BF357DD4 \
    && gpg --batch --verify /usr/local/bin/gosu.asc /usr/local/bin/gosu \
    && rm -r "$GNUPGHOME" /usr/local/bin/gosu.asc \
    && chmod +x /usr/local/bin/gosu \
    && gosu nobody true \
    && apt-get purge -y --auto-remove ca-certificates

# Fetch from spicefly.com
# WORKDIR /opt
# RUN wget http://www.spicefly.com/files/MusicMixer_x86_1.8.tgz
# RUN tar -xpf MusicMixer_x86_1.8.tgz && rm -f MusicMixer_x86_1.8.tgz
# RUN wget http://www.mediafire.com/file/mmcymixkxzz/genpuid_linux_1.4.tgz
# RUN tar -xpf genpuid_linux_1.4.tgz && rm -f genpuid_linux_1.4.tgz
# RUN cd /opt/MusicIP/MusicMagicMixer/server && \
# RUN unzip index-1.1.zip

ADD MusicMixer_x86_1.8.tgz /opt
# ADD genpuid_linux_1.4.tgz /opt
ADD index.html /opt/MusicIP/MusicMagicMixer/server
RUN rm -f /opt/MusicIP/MusicMagicMixer/mmm.ini
#ADD mmm.ini /opt/MusicIP/MusicMagicMixer
# RUN useradd -m -g users --uid 1057 musicip
RUN useradd -m -U -u 1000 musicip
VOLUME /home/musicip
RUN ln -s /home/musicip/MusicMagic/mmm.ini /opt/MusicIP/MusicMagicMixer/mmm.ini
EXPOSE 10002

CMD gosu musicip /opt/MusicIP/MusicMagicMixer/MusicMagicServer -verbose start
