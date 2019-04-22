.SILENT:
.DEFAULT_GOAL := help

DOCKER_IMAGE_NAME = elixir-phoenix
APP_NAME          = my_app

init: ## First development task
	docker build . --tag $(DOCKER_IMAGE_NAME)

create-project: ## Create a new project
	docker-compose run app mix phx.new . --app $(APP_NAME)

up: ## Start services
	docker-compose up -d

stop: ## Stop services
	docker-compose stop

migrate: ## Compile and migrate
	docker-compose run app bash -c "mix deps.compile && mix ecto.create && mix ecto.migrate"

destroy: ## Destroy all services and delete volume
	docker-compose down -v

.PHONY: help
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'