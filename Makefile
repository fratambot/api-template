#init:
#    poetry install --no-root
#test:
#    py.test tests

#.PHONY: init #test

start:
	poetry shell
	uvicorn api.main:app --reload --port=8080
.PHONY: start

test:
	poetry shell
	pytest -vv --durations=3
.PHONY: test

format:
	pre-commit run --all-files
.PHONY: format
