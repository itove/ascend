#!/bin/bash
#
# vim:ft=bash

set -e

. .env.local

for i in ${HOSTS[@]}
do
    echo Push to $i
    git push $i
    echo
done
