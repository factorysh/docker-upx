FROM bearstech/debian:stretch

RUN set -eux \
    &&  apt-get update \
    &&  apt-get install  -y --no-install-recommends \
                  upx-ucl \
    &&  apt-get clean \
    &&  rm -rf /var/lib/apt/lists/*

WORKDIR /upx
