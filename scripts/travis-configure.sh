#!/bin/bash

set -eu
set -o pipefail

# create the required directories
echo
echo 'creating build, input, and software directrorie...'
echo
mkdir -p ../build \
         ../input \
         ../software

echo
echo 'building software required for the project...'
echo
if [ "x$TRAVIS_OS_NAME" = xlinux ]; then
    ./project configure \
              --build-dir=../build \
              --input-dir=../input \
              --software-dir=../software \
              --all-highlevel 1> ../output-configure.log
fi

if [ "x$TRAVIS_OS_NAME" = xosx ]; then
    ./project configure \
              --build-dir=../build \
              --input-dir=../input \
              --software-dir=../software 1> ../output-analysis.log
fi

# END
