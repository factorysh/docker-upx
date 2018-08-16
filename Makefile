.PHONY: tests

GOSS_VERSION := 0.3.5

all: pull build

pull:
	docker pull bearstech/debian:stretch

build: image

image:
	docker build -t bearstech/upx .

push:
	docker push bearstech/upx

remove_image:
	docker rmi bearstech/upx

tests/bin/goss:
	mkdir -p tests/bin
	curl -o tests/bin/goss -L https://github.com/aelsabbahy/goss/releases/download/v$(GOSS_VERSION)/goss-linux-amd64
	chmod +x tests/bin/goss

test: tests/bin/goss
	docker run --rm -t \
		-v `pwd`/tests/bin/goss:/usr/local/bin/goss \
		-v `pwd`/tests:/goss \
		-w /goss \
		bearstech/upx \
		goss -g upx.yaml validate --max-concurrent 4 --format documentation

tests: test
