#!/usr/bin/env bash
DOME_BASE=`cd $(dirname $0); cd ..; pwd`
. $DOME_BASE/common/common.sh

wget -c https://www.eclipse.org/downloads/download.php?file=/jdtls/milestones/1.39.0/jdt-language-server-1.39.0-202408291433.tar.gz
