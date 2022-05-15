DOME_COLOR_ECHO="echo"

split_version() {
    local verstr=${1/v/}
    local vernums=($(echo $verstr | tr "." "\n"))
    echo ${vernums[@]}
}

bomup_version() {
    local verstr=$1

    local leftCount=3
    if [ $# -gt 1 ]; then
        local leftCount=$2
    fi

    local vernums=$(split_version $verstr)

    local ansstr=

    local i=1
    for num in ${vernums[@]}; do
        local prefix="v"
        if [ $i -gt 1 ]; then
            prefix="."
        fi

        local curr=0
        if [ $i -lt  $leftCount ]; then
            curr=$num
        elif [ $i -eq  $leftCount ]; then
            curr=$((num+1))
        fi

        ansstr="${ansstr}${prefix}${curr}"

        ((i++))
    done

    echo $ansstr
}

# bomup_version "v1.2.3"
# bomup_version "v1.2.3" 0
# bomup_version "v1.2.3" 1
# bomup_version "v1.2.3" 2
# bomup_version "v1.2.3" 3
# bomup_version "v1.2.3" 4
