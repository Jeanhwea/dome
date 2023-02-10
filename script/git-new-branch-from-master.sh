DOME_BASE=`cd $(dirname $0); cd ..; pwd`
. $DOME_BASE/common/common.sh

dome_new_branch_from_master() {
    local name=$(date +'%Y%m%d')
    dome_exec git checkout -b $name
}

dome_new_branch_from_master
