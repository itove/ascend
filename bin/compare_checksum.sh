#!/bin/bash
#
# vim:ft=bash

############### Variables ###############

############### Functions ###############

############### Main Part ###############

if [ -z "$1" ]; then
    echo 'Usage: bin/compare_checksum.sh <target_dir>'
    exit
fi

checksum_file=checksum
rm -f $checksum_file "$1"/$checksum_file

checksum(){
    files=`find . \( -path './.git' -o -path './.cache' \) -prune -o -type f -print`

    for i in $files
    do
        # if $i is "ASCII text" AND is a lfs
        if :; then
            checksum=$(grep sha256 $i)
            checksum=${checksum#*:}
        else
            echo Computing sha256sum for $i
            checksum=$(sha256sum $i | awk '{print $1}')
        fi
    done
}

# compute file sums in current dir
checksum

# compute file sums in target dir
pushd "$1"
checksum
popd

diff $checksum_file "$1"/$checksum_file
