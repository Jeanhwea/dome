DOME_COLOR_ECHO="echo"

bomup_version() {
    local verstr=$1

    local count=0
    if [ $# -gt 1 ]; then
        local count=$2
    fi

    local vernums=($(echo ${verstr/v/} | tr "." "\n"))

    local ans=""
    local i=1
    for num in ${vernums[@]}; do
        local prefix="v"
        if [ $i -gt 1 ]; then
            prefix="."
        fi

        local curr=0
        if [ $i -lt  $count ]; then
            curr=$num
        elif [ $i -eq  $count ]; then
            curr=$((num+1))
        fi

        ans="${ans}${prefix}${curr}"

        ((i++))
    done

    echo $ans
}

bomup_version "v1.2.3"
bomup_version "v1.2.3" 0
bomup_version "v1.2.3" 1
bomup_version "v1.2.3" 2
bomup_version "v1.2.3" 3
bomup_version "v1.2.3" 4
bomup_version "v1.2.3.4" 4
