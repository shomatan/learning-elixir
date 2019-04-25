# learning-elixir-phoenix

## Requirements
- Docker
- Docker Compose
- node.js (>= 5.0.0)

## Setup
    make init
    make deps
    make migrate
    cd assets && npm install

## Memo
### How to create a new project
    docker-compose run web mix phx.new . --app $(APP_NAME)