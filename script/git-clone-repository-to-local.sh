DOME_BASE=`cd $(dirname $0); cd ..; pwd`
. $DOME_BASE/common/common.sh


test_match_github() {
    local url=${1//.git}

    # match git@github.com:Jeanhwea/dome.git
    local pattern1='^git@github.com:([a-zA-Z0-9_-]+)/([.a-zA-Z0-9_-]+)$'
    if [[ $url =~ $pattern1 ]]; then
        echo "github" ${BASH_REMATCH[1]} ${BASH_REMATCH[2]}
    fi

    # match https://github.com/go-vgo/robotgo.git
    local pattern2='^(http|https)://github.com/([a-zA-Z0-9_-]+)/([.a-zA-Z0-9_-]+)$'
    if [[ $url =~ $pattern2 ]]; then
        echo "github" ${BASH_REMATCH[2]} ${BASH_REMATCH[3]}
    fi
}
# test_match_github "git@github.com:Jeanhwea/dome.git"
# test_match_github "https://github.com/go-vgo/robotgo.git"
# test_match_github "https://github.com/go-vgo/robotgo"
# test_match_github "http://github.com/go-vgo/test"

test_match_codebase() {
    local file=$*
    dome_exec_local $HOME/bin/local/test-match-codebase.sh $file
    if [ "$?" -eq 0 ]; then
        echo "codebase"
    fi
}

clone_repository_to_local() {
    local url=$*

    local remote="none"
    local repodir=
    local reponame=

    local fields=($(test_match_github $url))
    if [ ${#fields[@]} -ge 3 ]; then
        remote=${fields[0]}
        reponame=${fields[2]}
        if [ X"${fields[1]}" = X"Jeanhwea" ]; then
            repodir="$DOME_CODE_DIR/jeanhwea"
        else
            repodir="$DOME_CODE_DIR/github/${fields[1]}"
        fi
    fi

    if [ X"$remote" = X"none" ]; then
        fields=($(test_match_codebase $url))
        if [ ${#fields[@]} -ge 3 ]; then
            remote=${fields[0]}
            reponame=${fields[2]}
            repodir="$DOME_WORK_DIR/${fields[1]}"
        fi
    fi

    if [ X"$remote" != X"none" ]; then
        logi "Clone to $repodir/$reponame"
        (mkdir -p $repodir && cd $repodir && git clone --recurse-submodules -o $remote $url)
    else
        logw "Unknown URL: $url"
    fi
}

clone_repository_to_local $*
