#!/bin/bash
#
# vim:ft=bash

#image=swr.cn-south-1.myhuaweicloud.com/ascendhub/mindie:2.2.T30-800I-A2-py311-openeuler24.03-lts-arm64
image=swr.cn-south-1.myhuaweicloud.com/ascendhub/mindie:2.1.RC2-800I-A2-py311-openeuler24.03-lts

docker pull --platform=arm64 $image
