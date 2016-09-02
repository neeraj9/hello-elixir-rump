#!/bin/sh
#
# Update by Neeraj Sharma for running custom host erl
# so that rebar3 can use this script instead of the
# one available in host_erlangdist which will not
# run since that points to /opt/erlang/lib/erlang/.
# The other approach is to use erl from
#   build/rumprun-packages/erlang/build/bin
# but that is the raw build area of erlang, so
# all the test code, etc are packaged there creating
# an unnecessary discovery problem in rebar3 where
# it finds sasl from test folder with vsn 9.9 and needless
# to say incorrect.
#
#
# %CopyrightBegin%
# 
# Copyright Ericsson AB 1996-2012. All Rights Reserved.
# 
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# 
# %CopyrightEnd%
#

SCRIPT=$(readlink $0 || true)
if [ -z $SCRIPT ]; then
  SCRIPT=$0
fi;
MYDIR="$(cd `dirname "$SCRIPT"` && pwd -P)"

ROOTDIR="${MYDIR}/build/rumprun-packages/erlang/build/host_erlangdist/opt/erlang/lib/erlang"
BINDIR=$ROOTDIR/erts-7.3.1/bin
EMU=beam
PROGNAME=`echo $0 | sed 's/.*\///'`
export EMU
export ROOTDIR
export BINDIR
export PROGNAME
exec "$BINDIR/erlexec" ${1+"$@"}
