#!/bin/bash
#
# vim:ft=bash

############### Variables ###############
checksum_file=checksum

############### Functions ###############
is_lfs_pointer(){
    local ret
    ret=-1
    if [ "$1" = "ASCII text" ]; then
        if head -n 1 "$1" | grep -q "git-lfs.github.com/spec"; then
            ret=0
        fi
    fi

    return $ret
}

checksum(){
    files=`find . \( -path './.git' -o -path './.cache' \) -prune -o -type f -print`

    for i in $files
    do
        if is_lfs_pointer "$i"; then
            checksum=$(grep sha256 "$i")
            checksum=${checksum#*:}
        else
            echo Computing sha256sum for $i
            checksum=$(sha256sum "$i" | awk '{print $1}')
        fi
    done
}

############### Main Part ###############

if [ -z "$1" ]; then
    echo 'Usage: bin/compare_checksum.sh <target_dir>'
    exit
fi

rm -f $checksum_file "$1"/$checksum_file

# compute file sums in current dir
checksum

# compute file sums in target dir
pushd "$1"
checksum
popd

diff $checksum_file "$1"/$checksum_file
