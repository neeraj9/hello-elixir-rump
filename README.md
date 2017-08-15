# Hello Elixir Rump

[![Build Status](https://travis-ci.org/neeraj9/hello-elixir-rump.svg?branch=master)](https://travis-ci.org/neeraj9/hello-elixir-rump)
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

> Note that there is a known issue while building RumpRun unikernel
> under gcc-6, so it is better to stick with gcc-5 for now.
>
> You could do that as follows:
> CC=gcc-5 CXX=g++-5 make -f Makefile.rumprun .rumprun_packages_built

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

In order to compile elixir sources rebar3 is required, so install it
non-interactively.

    mix local.rebar --force

Now we are ready to build release of hello_phoenix project

    cd hello_phoenix
    MIX_ENV=prod mix do deps.get, compile, phoenix.digest, release
    cd ..
    
You will now find the release at the following location.

    hello_phoenix/rel/hello_phoenix/releases/0.0.1/hello_phoenix.tar.gz

The last step of generating application iso is as follows:

    ./create-ukernel.sh

This will create hello_phoenix-0.0.1.iso.

Enable tap0 interface and enable ip address to it as follows:

    sudo ip tuntap add tap0 mode tap
    sudo ip addr add 10.0.120.100/24 dev tap0
    sudo ip link set dev tap0 up

Now you can run the Elixir microkernel as follows:

    PATH=$(pwd)/build/rumprun/rumprun/bin:$PATH ./run-elixir-vm --virt=kvm --iso=hello_phoenix-0.0.1.iso

Alternatively, if you dont have kvm but just qemu then do the following:

    PATH=$(pwd)/build/rumprun/rumprun/bin:$PATH ./run-elixir-vm --iso=hello_phoenix-0.0.1.iso

The output will stream to serial.log, so open another window and monitor that
as follows:

    tail -f serial.log

> There is a substantial difference when running the unikernel in kvm (much
> faster) than simple qemu. Although, qemu does run things reasonably well
> but just slower.

## Thanks

Thanks for evaluating this project and hope you find it useful.
Feel free to create issues for bugs or new features.

## Authors

* Neeraj Sharma {[github: neeraj9](https://github.com/neeraj9)}

