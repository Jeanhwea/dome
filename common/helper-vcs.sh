vcs_bomup_version() {
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

# vcs_bomup_version "v1.2.3"
# vcs_bomup_version "v1.2.3" 0
# vcs_bomup_version "v1.2.3" 1
# vcs_bomup_version "v1.2.3" 2
# vcs_bomup_version "v1.2.3" 3
# vcs_bomup_version "v1.2.3" 4
# vcs_bomup_version "v1.2.3.4" 4

vcs_current_branch() {
    git branch --show-current
}

vcs_current_remote() {
    git remote | head -n 1
}

vcs_last_version() {
    verstr=$(git tag -l 'v*' | sort -V -r | head -n 1)
    if [ "$verstr" == "" ]; then
        verstr="v0.0.0"
    fi
    echo $verstr
}

# vcs_last_version

vcs_repository_is_clean() {
    if [ X"$(git status --porcelain)" = X"" ]; then
        echo "clean"
    else
        echo "dirty"
    fi
}

# vcs_repository_is_clean
