.SILENT:
.DEFAULT_GOAL := help

DOCKER_IMAGE_NAME   = elixir-phoenix
DOCKER_NETWORK_NAME = phoenix_network 
DB_HOST             = db
DB_USER             = postgres
DB_PASS             = postgres
DB_PORT             = 5432

init: ## First development task
	docker-compose build
	make create-network

up: ## Start services
	docker-compose up -d

stop: ## Stop services
	docker-compose stop

recreate: ## Force recreate services
	docker-compose up -d --force-recreate

migrate: ## Compile and migrate
	docker-compose up -d db
	make wait-db
	docker-compose run web bash -c 'mix deps.compile && mix ecto.create && mix ecto.migrate'
	docker-compose stop db

deps: ## Get all dependencies
	docker-compose run web mix deps.get	

gen-secret: ## Generate a salt
	docker-compose run web mix phx.gen.secret 32		

destroy: ## Destroy all services and delete volume
	docker-compose down -v

create-network:
	@if ! `docker network ls | grep -q $(DOCKER_NETWORK_NAME)`; then \
		echo 'Created a docker network: $(DOCKER_NETWORK_NAME)' && \
		docker network create $(DOCKER_NETWORK_NAME); \
	fi

wait-db:
	@docker run --rm --net $(DOCKER_NETWORK_NAME) -e PGPASSWORD=$(DB_PASS) postgres \
		bash -c ' \
			until psql -h "$(DB_HOST)" -p "$(DB_PORT)" -U "$(DB_USER)" -c "\l"; do \
				>&2 echo "**** PostgreSQL is unavailable - sleeping" && \
				sleep 1; \
			done \
		'

.PHONY: help
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'