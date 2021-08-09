#init:
#    poetry install --no-root
#test:
#    py.test tests

#.PHONY: init #test
shell:
	poetry shell
.PHONY: shell

start:
	poetry run uvicorn api.main:app --reload --port=8080
.PHONY: start

test:
	poetry run pytest -vv --durations=3
.PHONY: test

format:
	poetry run pre-commit run --all-files
.PHONY: format

notebook:
	poetry run jupyter notebook
.PHONY: notebook
