#!/usr/bin/env bash
DOME_BASE=`cd $(dirname $0); cd ..; pwd`
. $DOME_BASE/common/common.sh


test_match_github() {
    local url=${1//.git}

    # match https://github.com/go-vgo/robotgo.git
    local pattern2='^(http|https)://github.com/([a-zA-Z0-9_-]+)/([.a-zA-Z0-9_-]+)$'
    if [[ $url =~ $pattern2 ]]; then
        echo "ghproxy" ${BASH_REMATCH[2]} ${BASH_REMATCH[3]}
    fi
}
# test_match_github "git@github.com:Jeanhwea/dome.git"

clone_repository_with_proxy() {
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

    local url_proxy="https://ghproxy.com/${url}"
    if [ X"$remote" != X"none" ]; then
        logi "Clone to $repodir/$reponame"
        (mkdir -p $repodir && cd $repodir && git clone --recurse-submodules -o $remote $url_proxy)
        (cd $repodir/$reponame && git remote add github $url)
    else
        if [ $# -ge 2 ]; then
            remote=$2
            (git clone --recurse-submodules -o $remote $url)
        fi
        logw "Unknown URL: $url"
    fi
}

clone_repository_with_proxy  $*
