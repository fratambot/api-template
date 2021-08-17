#!/bin/sh

set -e


CURRENT_DIR=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
BASE_DIR="$(dirname "$CURRENT_DIR")"

echo "\n${BOLD}Running black..."
black --diff --color "${CURRENT_DIR}" "${BASE_DIR}/tests/"

echo "\n${BOLD}Running pylint..."
pylint "${CURRENT_DIR}" "${BASE_DIR}/tests/"