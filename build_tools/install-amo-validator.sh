#!/bin/bash

BASE_DIR="$(dirname $0)"
VENV_DIR=amov_venv

cd "$BASE_DIR"

if [[ -n "$INSTALL_VIRTUALENV" ]]; then
    VENV_VERSION=13.1.0
    VENV_NAME=virtualenv-$VENV_VERSION
    VENV_TGZ=${VENV_NAME}.tar.gz
    if [[ ! -d "$VENV_DIR" ]] || [[ ! -d "$VENV_DIR/bin" ]]; then
        if [[ ! -d "$VENV_NAME" ]]; then
            if [[ ! -f "$VENV_TGZ" ]]; then
                wget https://pypi.python.org/packages/source/v/virtualenv/$VENV_TGZ
            fi
            tar xf $VENV_TGZ
        fi
        $VENV_NAME/virtualenv.py "$VENV_DIR"
    fi
    source "$VENV_DIR"/bin/activate
fi

if [[ -d amo-validator ]]; then
    (cd amo-validator && git pull)
else
    git clone https://github.com/mozilla/amo-validator.git
fi
pip install -r amo-validator/requirements.txt
