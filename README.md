# learning-elixir

## Install [elixir](https://elixir-lang.org/)
### MacOS
    brew update
    brew install elixir

### Ubuntu
    wget https://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb && sudo dpkg -i erlang-solutions_1.0_all.deb
    sudo apt-get update
    sudo apt-get install esl-erlang
    sudo apt-get install elixir

### Docker
#### Interactive mode
    docker run -it --rm elixir

#### Bash
    docker run -it --rm elixir bash

Finally, when the version information can output by executing the command `elixir --version`,
you are ready to go

    Erlang/OTP 21 [erts-10.3.4] [source] [64-bit] [smp:8:8] [ds:8:8:10] [async-threads:1] [hipe] [dtrace]

    Elixir 1.8.1 (compiled with Erlang/OTP 21)

## [Phoenix](https://phoenixframework.org/)
### Requirements
- node.js (>= 5.0.0)
- PostgreSQL (default)

### Install
```
$ mix archive.install hex phx_new 1.4.3

Could not find Hex, which is needed to build dependency :phx_new
Shall I install Hex? (if running non-interactively, use "mix local.hex --force") [Yn] Y
* creating /Users/shoma/.mix/archives/hex-0.19.0
Resolving Hex dependencies...
Dependency resolution completed:
New:
  phx_new 1.4.3
* Getting phx_new (Hex package)
All dependencies are up to date
Compiling 10 files (.ex)
Generated phx_new app
Generated archive "phx_new-1.4.3.ez" with MIX_ENV=prod
Are you sure you want to install "phx_new-1.4.3.ez"? [Yn] Y
* creating /Users/shoma/.mix/archives/phx_new-1.4.3
```

Create a new project
```
$ mix phx.new hello

* creating hello/config/config.exs
* creating hello/config/dev.exs
* creating hello/config/prod.exs
* creating hello/config/prod.secret.exs
* creating hello/config/test.exs
* creating hello/lib/hello/application.ex
* creating hello/lib/hello.ex
* creating hello/lib/hello_web/channels/user_socket.ex
* creating hello/lib/hello_web/views/error_helpers.ex
* creating hello/lib/hello_web/views/error_view.ex
* creating hello/lib/hello_web/endpoint.ex
* creating hello/lib/hello_web/router.ex
* creating hello/lib/hello_web.ex
* creating hello/mix.exs
* creating hello/README.md
* creating hello/.formatter.exs
* creating hello/.gitignore
* creating hello/test/support/channel_case.ex
* creating hello/test/support/conn_case.ex
* creating hello/test/test_helper.exs
* creating hello/test/hello_web/views/error_view_test.exs
* creating hello/lib/hello_web/gettext.ex
* creating hello/priv/gettext/en/LC_MESSAGES/errors.po
* creating hello/priv/gettext/errors.pot
* creating hello/lib/hello/repo.ex
* creating hello/priv/repo/migrations/.formatter.exs
* creating hello/priv/repo/seeds.exs
* creating hello/test/support/data_case.ex
* creating hello/lib/hello_web/controllers/page_controller.ex
* creating hello/lib/hello_web/templates/layout/app.html.eex
* creating hello/lib/hello_web/templates/page/index.html.eex
* creating hello/lib/hello_web/views/layout_view.ex
* creating hello/lib/hello_web/views/page_view.ex
* creating hello/test/hello_web/controllers/page_controller_test.exs
* creating hello/test/hello_web/views/layout_view_test.exs
* creating hello/test/hello_web/views/page_view_test.exs
* creating hello/assets/webpack.config.js
* creating hello/assets/.babelrc
* creating hello/assets/css/app.css
* creating hello/assets/css/phoenix.css
* creating hello/assets/js/app.js
* creating hello/assets/js/socket.js
* creating hello/assets/package.json
* creating hello/assets/static/robots.txt
* creating hello/assets/static/images/phoenix.png
* creating hello/assets/static/favicon.ico

Fetch and install dependencies? [Yn] Y
* running mix deps.get
* running cd assets && npm install && node node_modules/webpack/bin/webpack.js --mode development

We are almost there! The following steps are missing:

    $ cd hello

Then configure your database in config/dev.exs and run:

    $ mix ecto.create

Start your Phoenix app with:

    $ mix phx.server

You can also run your app inside IEx (Interactive Elixir) as:

    $ iex -S mix phx.server
```

```
cd hello
```

Start postgres
```
docker run --name hello-db -p 15432:5432 -e POSTGRES_USER=postgres -e POSTGRES_PASSWORD=postgres -d postgres:9.6
```

Create database
```
$ mix ecto.create

Compiling 13 files (.ex)
Generated hello app
The database for Hello.Repo has been created
```

Start the Phoenix server
```
$ mix phx.server

[info] Running HelloWeb.Endpoint with cowboy 2.6.3 at 0.0.0.0:4000 (http)
[info] Access HelloWeb.Endpoint at http://localhost:4000

Webpack is watching the files…

...
```

After you can access `http://localhost:4000/`

### Add a GraphQL library
Delete the database once
    docker rm hello-db -f

Add [Absinthe](http://absinthe-graphql.org/) in `mix.exs`

    mix deps.get

At this point, create a database again

    docker run --name hello-db -p 15432:5432 -e POSTGRES_USER=postgres -e POSTGRES_PASSWORD=postgres -d postgres:9.6
    
    mix ecto.create

