#!/bin/sh

if [[ "$VERSION" == "" ]]
then
  VERSION="master"
fi


# Clone the requested branch only
git clone --recursive https://github.com/pytorch/pytorch --branch ${VERSION} --single-branch
cd pytorch

export CMAKE_PREFIX_PATH=${CONDA_PREFIX:-"$(dirname $(which conda))/../"}
MACOSX_DEPLOYMENT_TARGET=10.9 CC=clang CXX=clang++ python setup.py install

cd ..

VERSION=${VERSION} Rscript pin.R
