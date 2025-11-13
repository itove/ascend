#!/bin/bash
#
# vim:ft=bash

checksum_file=checksum

if [ -z "$1" ]; then
    echo 'Usage: bin/diff.sh <target_dir>'
    exit
fi

diff -r -x '*.safetensors' -x '.cache' -x '.git' -x '__pycache__' -x 'verify.log' -x '.gitignore' . "$1"

rm $checksum_file "$1"/$checksum_file

gen_checksum(){
    for i in *.safetensors
    do
        file_type=$(file -b $i)
        if [ "$file_type" = data ]; then
            cheksum=$(sha256sum $i)
        else
            checksum=$(grep sha256 $i)
            checksum=${checksum#*:}
        fi
        echo $i:$cheksum >> $checksum_file
    done
}

gen_checksum
cd "$1"
gen_checksum
cd -

diff $checksum_file "$1"/$checksum_file
