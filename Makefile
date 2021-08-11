# Docker

build:
	docker build --tag api-template --file docker/Dockerfile .
.PHONY: build

start:
	docker run -d --name api-template-container -p 80:80 api-template
.PHONY: start