#!/bin/bash

BASE_DIR="$(basename $0)"

cd "$BASE_DIR"/amo-validator
./amo-validator --determined ../../dist/xpi/octoaudit.xpi
