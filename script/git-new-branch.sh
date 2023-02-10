DOME_BASE=`cd $(dirname $0); cd ..; pwd`
. $DOME_BASE/common/common.sh

dome_new_branch() {
    local sub="A"
    if [ $# -gt 0 ]; then
        local sub=$1
    fi

    local name=$(date +'%m%d')
    dome_exec git checkout -b "jh/$name$sub"
}

dome_new_branch $*
