DOME_BASE=`cd $(dirname $0); cd ..; pwd`
. $DOME_BASE/common/common.sh

dwim_print_date_str() {
    local str=${*/T/}

    local pattern='^[0-9]+$'
    if [[ $str =~ $pattern ]]; then
        ts_to_str $str
    else
        str_to_ts $str
    fi
}

dwim_print_date_str $*
