#!/bin/sh

# Prepare the development environment

# This script is intended to be run on the development machine.
# It will install the required packages and set up the development environment.
# It uses the currently active virtual environment, existing .venv or
# creates a new one.

PYTHON=python3
venvdir=.venv

if test -z "$VIRTUAL_ENV" ; then
    if test -d "$venvdir" ; then
        # shellcheck source=/dev/null
        . "$venvdir/bin/activate" || exit 1
    else
        echo "Creating new virtual environment $venvdir"
        "$PYTHON" -m venv "$venvdir" || exit 1
        # shellcheck source=/dev/null
        . "$venvdir/bin/activate" || exit 1
        "$PYTHON" -m pip install --upgrade pip
        "$PYTHON" -m pip install --upgrade setuptools
    fi
fi

"$PYTHON" -m pip install -r requirements_dev.txt
"$PYTHON" -m pip install -r requirements.txt

