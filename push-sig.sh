#!/bin/bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

cd "$SCRIPT_DIR"

source ./env/vars.sh

./lib/fuse.sh

INPUT_PATH="$1"
CONTEST_ID="$2"
PROBLEM_ID="$3"
LANGUAGE="$4"
OUTPUT_PATH="~/contest/$CONTEST_ID/problems/$PROBLEM_ID/submit/$LANGUAGE"

FILE_NAME=$(basename "$INPUT_PATH")

ssh "$EJUDGE_LOGIN@$EJUDGE_SERVER_ADRESS" "mkdir -p ~/temp/$FILE_NAME"

scp "$INPUT_PATH" "$EJUDGE_LOGIN@$EJUDGE_SERVER_ADRESS":"~/temp/$FILE_NAME/$FILE_NAME"

ssh "$EJUDGE_LOGIN@$EJUDGE_SERVER_ADRESS" EJUDGE_LOGIN="$EJUDGE_LOGIN" FILE_NAME="$FILE_NAME" OUTPUT_PATH="$OUTPUT_PATH" "bash -s" < sig.sh

