DOME_BASE=`cd $(dirname $0); cd ..; pwd`
. $DOME_BASE/common/common.sh

dwim_print_date_str() {
    local str=${*/T/}

    local pattern1='^[0-9]+$'
    local pattern2='^[0-9]{4}-[0-9]{2}-[0-9]{2} [0-9]{2}:[0-9]{2}:[0-9]{2}$'
    if [[ $str =~ $pattern1 ]]; then
        ts_to_str $str
    elif [[ $str =~ $pattern2 ]]; then
        str_to_ts $str
    else
        logw "Unknown DateTime String: $*"
    fi
}

dwim_print_date_str $*
