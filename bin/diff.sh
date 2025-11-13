#!/bin/bash
#
# vim:ft=bash

if [ -z "$1"]; then
    echo 'Usage: bin/diff.sh <target_dir>'
    exit
fi

diff -r -x '*.safetensors' -x '.cache' -x '.git' -x '__pycache__' -x 'verify.log' -x '.gitignore' . "$1"
