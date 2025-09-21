#!/bin/bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

cd "$SCRIPT_DIR"

source ./env/vars.sh

./lib/fuse.sh

FILE_INPUT_PATH="$1"
CONTEST_ID="$2"
PROBLEM_ID="$3"
LANGUAGE="$4"
FILE_OUTPUT_PATH="~/contest/$CONTEST_ID/problems/$PROBLEM_ID/submit/$LANGUAGE"

scp "$FILE_INPUT_PATH" "$EJUDGE_LOGIN@$EJUDGE_SERVER_ADRESS":"$FILE_OUTPUT_PATH"