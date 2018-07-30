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
