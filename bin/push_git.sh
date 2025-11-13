#!/bin/bash
#
# vim:ft=bash

set -e

. .env.local

for i in ${HOSTS[@]}
do
    git push $i
done
