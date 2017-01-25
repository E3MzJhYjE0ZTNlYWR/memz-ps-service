#!/bin/bash

cd /home
openssl enc -d -aes-256-cbc -in package.zip.enc -out package.zip -pass pass:$UNLOCK_KEY
unzip package.zip
rm -rf package.*
mkdir -p /go/src/github.com/Beh01der/memz-ps
mv ./package/* /go/src/github.com/Beh01der/memz-ps
cd /go/src/github.com/Beh01der/memz-ps
go install
cd /home

/go/bin/memz-ps $@