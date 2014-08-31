#!/bin/bash

BASE_DIR="$(basename $0)"

cd "$BASE_DIR"
git clone https://github.com/mozilla/amo-validator.git
pip install amo-validator/requirements.txt
