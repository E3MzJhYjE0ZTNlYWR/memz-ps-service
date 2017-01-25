#!/bin/bash

# extract sources
cd /home
openssl enc -d -aes-256-cbc -in package.zip.enc -out package.zip -pass pass:$UNLOCK_KEY
unzip package.zip
rm -rf package.*
mkdir -p /go/src/github.com/Beh01der/memz-ps
mv ./package/* /go/src/github.com/Beh01der/memz-ps

# build
cd /go/src/github.com/Beh01der/memz-ps
go install

# cleanup
rm -rf /go/pkg/*
rm -rf /go/src/*

# start service
cd /home
/go/bin/memz-ps $@