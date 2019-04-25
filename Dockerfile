FROM elixir:1.8.1

ENV NODE_VERSION 10.x

RUN set -xe \
  && curl -sL https://deb.nodesource.com/setup_${NODE_VERSION} | bash \
  && apt-get install -y nodejs inotify-tools

RUN npm install npm@latest -g

RUN set -xe \
  && mix local.hex --force \ 
  && mix archive.install hex phx_new 1.4.3 --force \
  && mix local.rebar --force

WORKDIR /app