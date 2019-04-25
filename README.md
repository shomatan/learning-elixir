# learning-elixir-phoenix

## Requirements
- Docker
- node.js (>= 5.0.0)

## Create a new project
    mkdir new_app
    cp app/Dockerfile new_app/
    cp app/docker-compose.yml new_app/
    cd new_app
    docker-compose run web mix phx.new . --app my_app

For database
    cp -f ../app/config/dev.exs config/

Start
    docker-compose up -d

Migrate
    docker-compose run web bash -c "mix deps.compile && mix ecto.create && mix ecto.migrate"

