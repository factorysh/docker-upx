FROM bearstech/debian:stretch

RUN apt-get update && \
    apt-get install  -y --no-install-recommends \
        upx \
    && rm -rf /var/lib/apt/lists/*

RUN useradd --home-dir /upx --create-home --shell /bin/bash upx
WORKDIR /upx
USER upx
