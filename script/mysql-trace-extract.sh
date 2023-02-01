DOME_BASE=`cd $(dirname $0); cd ..; pwd`
. $DOME_BASE/common/common.sh

dome_trace_extract() {
    local conn_id=0
    if [ $# -gt 0 ]; then
        local conn_id=$1
    fi

    local shim=$(date +"%Y%m%d-%H%M%S")
    local prefix="/tmp/trace-${conn_id}-"
    local outfile="${prefix}${shim}.txt"
    echo $outfile
    tail -f /tmp/mysqld.trace | grep "^T@${conn_id}" | sed 's/^T[^:]*: //' | sed 's/| /\t/g' | tee $outfile
    # sed 's/^T[^:]*: /| /' | awk '{if (/^[| ]+(>|<)/) {gsub(/\| /,"*",$0); print} else {gsub(/\| /,"",$0); print}}' | sed 's/*</* </;s/*>/* >/'
}

dome_trace_extract $*
