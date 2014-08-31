#!/bin/bash

BASE_DIR="$(dirname $0)"

if [[ -n "$TRAVIS" ]]; then
    cd "$BASE_DIR"
    export SPIDERMONKEY_INSTALLATION="$(pwd)/spidermonkey"
fi

cd "$BASE_DIR"/amo-validator
./amo-validator --determined ../../dist/xpi/octoaudit.xpi
