#!/bin/bash
#
# vim:ft=bash


if [ -z "$1" ]; then
    echo 'Usage: bin/diff.sh <target_dir>'
    exit
fi

checksum_file=checksum
rm -f $checksum_file "$1"/$checksum_file

echo Comparing text files...
diff -r -x '*.safetensors' -x '.cache' -x '.git' -x '__pycache__' -x 'verify.log' -x '.gitignore' . "$1"

echo Comparing lfs...

gen_checksum(){
    for i in *.safetensors
    do
        file_type=$(file -b $i)
        if [ "$file_type" = data ]; then
            echo Computing sha256sum for $i
            checksum=$(sha256sum $i)
        else
            checksum=$(grep sha256 $i)
            checksum=${checksum#*:}
        fi
        echo $i:$checksum >> $checksum_file
    done
}

gen_checksum
cd "$1"
pwd
gen_checksum
cd -
pwd

diff $checksum_file "$1"/$checksum_file
