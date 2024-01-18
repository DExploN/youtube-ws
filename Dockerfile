FROM python:3.12

# install all the dependencies and enable PHP modules
RUN set -e; \
  apt-get update && apt-get upgrade -y \
    && apt-get install -y \
      git\
      zip \
      curl \
      nano \
      wget

RUN git clone https://github.com/ytdl-org/youtube-dl.git youtube-dl &&\
    cd youtube-dl && \
    make youtube-dl && \
    cp youtube-dl /usr/local/bin/ && \
    chmod a+rx /usr/local/bin/youtube-dl

RUN apt-get install -y \
    ffmpeg

ARG UID
ARG USER_NAME

RUN useradd -m -u ${UID} -g root ${USER_NAME}