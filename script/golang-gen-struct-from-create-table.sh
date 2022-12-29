DOME_BASE=`cd $(dirname $0); cd ..; pwd`
. $DOME_BASE/common/common.sh


dome_gen_struct() {
    pbpaste | python3 $DOME_BASE/python/gen-struct-from-create-table-01.py | goimports
}

dome_gen_struct $*
