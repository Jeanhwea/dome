#!/usr/bin/env bash
DOME_BASE=`cd $(dirname $0); cd ..; pwd`
. $DOME_BASE/common/common.sh

TODAY=$(date +'%Y-%m-%d %H:%M:%S')
FILETAG=$(date +'_%Y%m%d_%H%M%S')
FONT="SimSun"
OS=$(uname)
if [ X"$OS" == X"Darwin" ]; then
    FONT="PingFang SC Regular"
fi


doc_conv_to_pdf() {
    local full=$1
    local dir=$(dirname $full)
    local base=$(basename $full)
    local pdf=${base//.*/${FILETAG}.pdf}
    local out="${PWD}/$pdf"

    cd $dir

    pandoc --pdf-engine=xelatex \
           --toc --number-sections \
           -V date="${TODAY}" \
           -V author="Jeffrey" \
           -V mainfont="$FONT" \
           -V documentclass=ctexart \
           -V geometry:margin='1in' \
           -o "$out" \
           $base

    echo "Save to $out"
}

doc_conv_to_pdf $*
