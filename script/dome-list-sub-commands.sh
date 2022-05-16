DOME_BASE=`cd $(dirname $(readlink -f $0)); cd ..; pwd`
. $DOME_BASE/common/common.sh


dome_get_subcmds() {
    cd $DOME_BASE/script && \
        find . -type f -iname "*.sh" | sed 's#.*/##;s#.sh$##g' | sort
}

dome_get_subcmds
