DOME_BASE=`cd $(dirname $0); cd ..; pwd`
. $DOME_BASE/common/common.sh

dwim_print_date_str() {
    if [ $# -lt 1 ]; then
        date +"%s"
        return
    fi

    local str=${*/T/}

    local pattern1='^[0-9]+$'
    local pattern2='^[0-9]{4}-[0-9]{2}-[0-9]{2}( [0-9]{2}:[0-9]{2}:[0-9]{2}){0,1}$'
    if [[ $str =~ $pattern1 ]]; then
        ts_to_str $str
    elif [[ $str =~ $pattern2 ]]; then
        local time=${BASH_REMATCH[1]}
        if [ X"$time" = X"" ]; then
            str_to_ts $str "00:00:00"
            return
        fi
        str_to_ts $str
    else
        logw "Unknown DateTime String: $*"
    fi
}

dwim_print_date_str $*
