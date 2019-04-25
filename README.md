# learning-elixir-phoenix

## Requirements
- Docker
- Docker Compose
- node.js (>= 5.0.0)

## Setup
    make init
    make deps

## Memo
### How to create a new project
    docker-compose run web mix phx.new $(DESTINATION_DIR) --app $(APP_NAME)