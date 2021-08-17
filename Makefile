#SHELL := /bin/sh

start:
	@echo "\n${BOLD}Starting containers..${NORMAL} 🐳"
	docker-compose up -d
.PHONY: start

stop:
	@echo "\n${BOLD}Stopping containers..${NORMAL} 👋" && \
	docker-compose stop
	@echo "\n${BOLD}Cleaning the mess..${NORMAL} 🧽"
	docker system prune -f
.PHONY: stop

test:
	docker build -t test-image --rm --file docker/Dockerfile --target test .
	@echo "\n${BOLD}Running all tests..${NORMAL} 🔬"
	docker run -it test-image
	@echo "\n${BOLD}Cleaning the mess..${NORMAL} 🧽"
	docker system prune -f
.PHONY: tests

lint:
	@echo "\n${BOLD}Formatting and linting..${NORMAL} 📝"
	docker build -t lint-image --rm --file docker/Dockerfile --target lint .
	docker run -it lint-image
	@echo "\n${BOLD}Cleaning the mess..${NORMAL} 🧽"
	docker system prune -f
.PHONY: lint

local-lint:
	@echo "\n${BOLD}Checking if you have poetry installed..." && \
	if ! command -v poetry; then \
		echo "Poetry not found 😕 "; \
	else \
		echo "Poetry found ! Installing the venv..."; \
		poetry install --no-root; \
		echo "\n${BOLD}Running black..."; \
		poetry run black app tests; \
		echo "\n${BOLD}Running pylint..."; \
		poetry run pylint app tests; \
	fi
.PHONY: local-lint