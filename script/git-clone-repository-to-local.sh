DOME_BASE=`cd $(dirname $(readlink -f $0)); cd ..; pwd`
. $DOME_BASE/common/common.sh


test_match_github() {
    local url=$1

    # match git@github.com:Jeanhwea/dome.git
    local pattern='^git@github.com:([_0-9a-zA-Z-]+)/([_0-9a-zA-Z-]+).git$'
    if [[ $url =~ $pattern ]]; then
        echo "github" ${BASH_REMATCH[1]} ${BASH_REMATCH[2]}
    fi

    # match https://github.com/go-vgo/robotgo.git
    local pattern='^https://github.com/([_0-9a-zA-Z-]+)/([_0-9a-zA-Z-]+).git$'
    if [[ $url =~ $pattern ]]; then
        echo "github" ${BASH_REMATCH[1]} ${BASH_REMATCH[2]}
    fi
}
# test_match_github "git@github.com:Jeanhwea/dome.git"
# test_match_github "https://github.com/go-vgo/robotgo.git"


clone_repository_to_local() {
    local url=$*

    local fields=($(test_match_github $url))
    local remote="none"
    local repodir=
    local name=
    if [ ${#fields[@]} -ge 3 ]; then
        remote=${fields[0]}
        name=${fields[2]}
        if [ ${fields[1]} == "Jeanhwea" ]; then
            repodir="$DOME_CODE_DIR/jeanhwea"
        else
            repodir="$DOME_CODE_DIR/github/${fields[1]}"
        fi
    fi

    if [ $remote != "none" ]; then
        logi "Clone to $repodir/$name"
        (mkdir -p $repodir && cd $repodir && git clone -o $remote $url)
    fi
}

clone_repository_to_local $*
