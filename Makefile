GOSS_VERSION := 0.3.5
GIT_VERSION := $(shell git rev-parse HEAD)
GIT_DATE := $(shell git show -s --format=%ci HEAD)

all: pull build

pull:
	docker pull bearstech/debian:stretch

build:
	docker build \
		--build-arg GIT_VERSION=${GIT_VERSION} \
		--build-arg GIT_DATE="${GIT_DATE}" \
		-t bearstech/upx \
		.

push:
	docker push bearstech/upx

remove_image:
	docker rmi bearstech/upx

tests_upx/bin/goss:
	mkdir -p tests_upx/bin
	curl -o tests_upx/bin/goss -L https://github.com/aelsabbahy/goss/releases/download/v$(GOSS_VERSION)/goss-linux-amd64
	chmod +x tests_upx/bin/goss

test: tests_upx/bin/goss
	docker run --rm -t \
		-v `pwd`/tests_upx/bin/goss:/usr/local/bin/goss \
		-v `pwd`/tests_upx:/goss \
		-w /goss \
		bearstech/upx \
		goss -g upx.yaml validate --max-concurrent 4 --format documentation

down:

tests: test
