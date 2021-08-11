#!/bin/sh

set -e

# activate virtual environment
. /opt/pysetup/.venv/bin/activate


# Evaluating passed command:
exec "$@"
