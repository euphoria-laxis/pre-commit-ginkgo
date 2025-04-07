#!/usr/bin/env bash

set -eu -o pipefail

# verify that go is installed.
if ! command -v go &> /dev/null ; then
    echo "go is not installed or available in the PATH" >&2
    echo "please check https://golang.org/doc/install" >&2
    exit 1
fi

# verify that ginkgo is installed.
if ! command -v ginkgo &> /dev/null ; then
    echo "ginkgo is not installed or available in the PATH" >&2
    echo "please check https://onsi.github.io/ginkgo/" >&2
    exit 1
fi

# verify that pre commit hook is correctly configured.
if [ $# -eq 0 ]; then
    echo "No arguments supplied"
    echo "Please add `args: [-packages=_test]` in your pre-commit config"
    exit 1
fi

# run tests on every packages listed in .pre-commit-config.yaml.
for d in "$1"
do
    echo "run test on package $d"
    go test -v $d
done