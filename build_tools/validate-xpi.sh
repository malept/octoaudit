#!/bin/bash

BASE_DIR="$(dirname $0)"

if [[ -n "$TRAVIS" ]]; then
    cd "$BASE_DIR"
    export SPIDERMONKEY_INSTALLATION="$(pwd)/spidermonkey"
    cd amo-validator
else
    cd "$BASE_DIR"/amo-validator
fi

./amo-validator --determined ../../dist/xpi/octoaudit.xpi
