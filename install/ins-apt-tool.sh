#!/usr/bin/env bash
DOME_BASE=`cd $(dirname $0); cd ..; pwd`
. $DOME_BASE/common/common.sh

sudo apt install -y \
     editorconfig \
     gdb \
     git \
     tree \
     ripgrep \
     pandoc \
     jq \
     unar \
     zoxide
