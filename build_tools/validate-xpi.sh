#!/bin/bash

BASE_DIR="$(basename $0)"
VENV_DIR="$BASE_DIR/amov_venv"

source "$VENV_DIR"/bin/activate

cd "$BASE_DIR"/amo-validator
./amo-validator --determined ../../dist/xpi/octoaudit.xpi
