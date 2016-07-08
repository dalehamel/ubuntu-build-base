#!/bin/bash

[ -f seed_rootfs.tar ] || ./seed.sh

docker build -t dalehamel/ubuntu-build-base .
