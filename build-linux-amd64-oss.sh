#!/bin/bash

set -xu

ROOT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

TEST_BUILD_DIR=$ROOT_DIR/build

[ -d $TEST_BUILD_DIR ] && rm -Rf $TEST_BUILD_DIR/* || mkdir -p $TEST_BUILD_DIR
conan remote list
CONAN_USER_INFO=$(conan user -r psl-conan)
if [ "$CONAN_USER_INFO" == "Current user of remote 'psl-conan' set to: 'None' (anonymous)" ]; then
    echo "Logging into psl-conan server."
    echo "Please, enter psl-conan (artifactory-cpp) credentials when prompted"
    conan user -r psl-conan  -p
fi
conan create $ROOT_DIR   -tbf $TEST_BUILD_DIR

