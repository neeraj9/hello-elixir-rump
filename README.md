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
    source setenv.sh
    mix archive.install https://github.com/phoenixframework/archives/raw/master/phoenix_new.ez --force
    
**TODO**

> The build will automatically build the Elixir application unikernel.

## Thanks

Thanks for evaluating this project and hope you find it useful.
Feel free to create issues for bugs or new features.

## Authors

* Neeraj Sharma {[github: neeraj9](https://github.com/neeraj9)}

