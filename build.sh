#!/usr/bin/env bash

set -x

mkdir -p dist
export GOOS="linux"
export CGO_ENABLED=0
for arch in amd64 386 amd64p32 arm arm64 mips mips64 mipsle mips64le ppc64 ppc64le riscv riscv64 s390 s390x; do GOARCH="$arch" go build && file supercronic | grep 'statically linked' && mv supercronic "dist/supercronic-${GOOS}-${arch}"; done
pushd dist
ls -lah *
file *
sha1sum *
sha256sum *
popd
