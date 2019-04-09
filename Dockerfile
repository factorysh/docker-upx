FROM bearstech/debian:stretch

RUN set -eux \
    &&  apt-get update \
    &&  apt-get install  -y --no-install-recommends \
                  upx-ucl \
    &&  apt-get clean \
    &&  rm -rf /var/lib/apt/lists/* \
    &&  useradd --home-dir /upx --create-home --shell /bin/bash upx

WORKDIR /upx
USER upx

ARG GIT_VERSION
LABEL com.bearstech.source.upx=https://github.com/factorysh/docker-upx/commit/${GIT_VERSION}

