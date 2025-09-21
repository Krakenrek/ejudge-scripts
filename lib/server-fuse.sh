#!/bin/bash

mkdir -p ~/contest

if [[ -z $(ls ~/contest) ]]; then
    /opt/ejudge/bin/ejudge-fuse --user "$EJUDGE_LOGIN" --password "$EJUDGE_CLIENT_PASSWORD" --url "$EJUDGE_URL" ~/contest -o use_ino
else
    exit 0
fi


