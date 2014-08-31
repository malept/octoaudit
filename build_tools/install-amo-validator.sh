#!/bin/bash

VENV_DIR="$(basename $0)/amov_venv"

# Assume that virtualenv is installed.

virtualenv "$VENV_DIR"
source "$VENV_DIR"/bin/activate

git clone https://github.com/mozilla/amo-validator.git
pip install amo-validator/requirements.txt
