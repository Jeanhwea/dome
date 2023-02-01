DOME_BASE=`cd $(dirname $0); cd ..; pwd`
. $DOME_BASE/common/common.sh

dome_trace_extract() {
    local conn_id=$1
    dome_exec grep /tmp/mysqld.trace | grep "^T@${conn_id}"
}

dome_trace_extract
