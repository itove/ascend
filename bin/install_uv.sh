#!/bin/bash
#
# vim:ft=bash

py_ver=3.13

curl -LsSf https://astral.sh/uv/install.sh | sh

uv python install $py_ver
