#!/bin/sh
#
# (c) copyright 2016 Neeraj Sharma

set -x

PKG=hello_phoenix
VSN=0.0.1

export PATH=`pwd`:`pwd`/build/rumprun-packages/erlang/build/host_erlangdist/opt/erlang/lib/erlang/erts-7.3.1/bin:`pwd`/build/tools/usr/local/bin:$PATH

DEPLOYMENT_PATH=_deployed-${PKG}-${VSN}

if [ -d "${DEPLOYMENT_PATH}" ];
then
  echo "${DEPLOYMENT_PATH} already exists."
  exit 1
fi

mkdir -p ${DEPLOYMENT_PATH}/lib/erlang
cd ${DEPLOYMENT_PATH}/lib/erlang
tar -xzf ../../../${PKG}/rel/${PKG}/releases/${VSN}/${PKG}.tar.gz
cd ../../../

# The following is not required after change in run-elixir-vm
# where -boot is specifically provided.
#cd ${DEPLOYMENT_PATH}/lib/erlang/bin
#rm -f start.boot
#ln -s ../releases/${VSN}/start.boot .
#cd ../../../../

cd ${DEPLOYMENT_PATH}/lib/erlang/releases
ln -s ${VSN} latest
cd ../../../../

ERLANG_DIST_PATH=build/rumprun-packages/erlang/build/erlangdist/opt/erlang
cp ${ERLANG_DIST_PATH}/erl_inetrc ${DEPLOYMENT_PATH}/
cp ${ERLANG_DIST_PATH}/hosts ${DEPLOYMENT_PATH}/hosts
cp ${ERLANG_DIST_PATH}/resolv.conf ${DEPLOYMENT_PATH}/resolv.conf
mkdir -p ${DEPLOYMENT_PATH}/lib/erlang/lib/setnodename-0.0.1/ebin
cp build/rumprun-packages/erlang/examples/setnodename/*.beam ${DEPLOYMENT_PATH}/lib/erlang/lib/setnodename-${VSN}/ebin/

genisoimage -l -r -o ${PKG}-${VSN}.iso ${DEPLOYMENT_PATH}
