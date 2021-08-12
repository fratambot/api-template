start:
	@echo "\n${BOLD}Starting containers..${NORMAL} 🐳"
	docker-compose up -d
.PHONY: start

stop: ## Stop local Docker environment
	@echo "\n${BOLD}Stopping containers..${NORMAL} 👋" && \
	docker-compose stop
.PHONY: stop