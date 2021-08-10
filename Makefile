# Docker

build:
	docker build --tag api-template --file docker/Dockerfile .
.PHONY: build

start:
	docker run -d --name myapi -p 8000:8000 api-template
.PHONY: start

# Poetry TODO: from inside docker image ?

shell:
	poetry shell
.PHONY: shell

test:
	poetry run pytest -vv --durations=3
.PHONY: test

format:
	poetry run pre-commit run --all-files
.PHONY: format

notebook:
	poetry run jupyter notebook
.PHONY: notebook
