#!/bin/bash

openssl dgst -sha256 -sign "~/$EJUDGE_LOGIN.pem" -hex < "~/temp/$FILE_NAME/$FILE_NAME" > "~/temp/$FILE_NAME/sign"

cat "~/temp/$FILE_NAME/sign" >> "~/temp/$FILE_NAME/$FILE_NAME"

cp "~/temp/$FILE_NAME/$FILE_NAME" "$OUTPUT_PATH"

rm -rf "~/temp/$FILE_NAME"