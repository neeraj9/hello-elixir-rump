# Hello Elixir Rump

[![Software License (3-Clause BSD)](https://img.shields.io/badge/license-BSD%203--Clause-blue.svg?style=flat-square)](http://opensource.org/licenses/BSD-3-Clause)

Say hello to Elixir Microkernel powered by Rumprun unikernel. This project
is apart from many things an example of running Elixir microkernel powered
by the Rumprun unikernel.

The project is under active development and hence lacks details on what
else this project is supposed to do.

## Motivation

The motivation as indicated earlier is partly to demonstrate how Elixir
applications can be built and run over the Elixir microkernel (powered by
Rumprun unikernel) and partly for other reasons which will be discussed
once the projects starts taking shape. Stay tuned!

## Build

After you are done setting up the development environment the build is
pretty straight-forward (see below).

    git clone https://github.com/neeraj9/hello-elixir-rump
    cd hello-elixir-rump
    make -f Makefile.rumprun .rumprun_packages_built
    make -f Makefile.elixir .elixir_built

Setup the environment variable so the correct version of erl, elixir, hex,
mix are used for the subsequent build.

> Note remove $HOME/.mix and $HOME/.hex in case you dont want to
> get weird errors due to mismatch of different versions of Elixir.

    source setenv.sh
    mix archive.install https://github.com/phoenixframework/archives/raw/master/phoenix_new.ez --force
    
The following will install Hex, which is needed to build dependency :phoenix

    mix local.hex --force

Now we are ready to build release of hello_phoenix project

    MIX_ENV=prod mix do deps.get, compile, release
    
You will now find the release at the following location.

    hello_phoenix/rel/hello_phoenix/releases/0.0.1/hello_phoenix.tar.gz

The last step of generating application iso is as follows:

    ./create-ukernel.sh

This will create hello_phoenix-0.0.1.iso.


## Thanks

Thanks for evaluating this project and hope you find it useful.
Feel free to create issues for bugs or new features.

## Authors

* Neeraj Sharma {[github: neeraj9](https://github.com/neeraj9)}

