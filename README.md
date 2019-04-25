# learning-elixir-phoenix

## Requirements
- Docker
- Docker Compose
- node.js (>= 5.0.0)

## Setup
    make init
    make deps
    make migrate
    cd app/assets && npm install
    make gen-secret 

## Usage
    make up

## Memo
### How to create a new project
    docker-compose run web mix phx.new . --app $(APP_NAME)