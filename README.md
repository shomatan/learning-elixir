# learning-elixir

## Install Elixir
### MacOS
    brew update
    brew install elixir

### Ubuntu
    wget https://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb && sudo dpkg -i erlang-solutions_1.0_all.deb
    sudo apt-get update
    sudo apt-get install esl-erlang
    sudo apt-get install elixir

### Docker
- Interactive mode

    docker run -it --rm elixir

- Bash

    docker run -it --rm elixir bash


Finally, when the version information can output by executing the command `elixir --version`,
you are ready to go

    Erlang/OTP 21 [erts-10.3.4] [source] [64-bit] [smp:8:8] [ds:8:8:10] [async-threads:1] [hipe] [dtrace]

    Elixir 1.8.1 (compiled with Erlang/OTP 21)