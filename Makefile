
image:
	docker build -t bearstech/upx .

build: image

pull:
	docker pull bearstech/debian:stretch

push:
	docker push bearstech/upx

tests:
	@echo "Some tests"
