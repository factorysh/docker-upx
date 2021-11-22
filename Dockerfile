FROM bearstech/debian:bullseye

RUN set -eux \
    &&  export http_proxy=${HTTP_PROXY} \
    &&  apt-get update \
    &&  apt-get install  -y --no-install-recommends \
                  upx-ucl \
    &&  apt-get clean \
    &&  rm -rf /var/lib/apt/lists/* \
    &&  useradd --home-dir /upx --create-home --shell /bin/bash upx

WORKDIR /upx
USER upx

# generated labels

ARG GIT_VERSION
ARG GIT_DATE
ARG BUILD_DATE

LABEL \
    com.bearstech.image.revision_date=${GIT_DATE} \
    org.opencontainers.image.authors=Bearstech \
    org.opencontainers.image.revision=${GIT_VERSION} \
    org.opencontainers.image.created=${BUILD_DATE} \
    org.opencontainers.image.url=https://github.com/factorysh/docker-upx \
    org.opencontainers.image.source=https://github.com/factorysh/docker-upx/blob/${GIT_VERSION}/Dockerfile
