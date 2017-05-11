#!/bin/bash

# Install go
VERSION=1.8.1
OS=linux
ARCH=amd64

wget https://storage.googleapis.com/golang/go$VERSION.$OS-$ARCH.tar.gz -O /tmp/go$VERSION.$OS-$ARCH.tar.gz
tar -C /usr/local -xzf /tmp/go$VERSION.$OS-$ARCH.tar.gz
echo "export PATH=$PATH:/usr/local/go/bin" > /etc/profile

# Run application
echo "${GOAPP}" > /tmp/goApp.go
/usr/local/go/bin/go run /tmp/goApp.go
