DOME_BASE=`cd $(dirname $0); cd ..; pwd`
. $DOME_BASE/common/common.sh

dome_trace_extract() {
    local conn_id=0
    if [ $# -gt 0 ]; then
        local conn_id=$1
    fi

    local shim=$(date +"%Y%m%d-%H%M%S")
    local prefix="/tmp/trace-${conn_id}-"
    local out="${prefix}${shim}.txt"
    echo $out
    tail -f /tmp/mysqld.trace | grep "^T@${conn_id}" | tee $out
}

dome_trace_extract $*
