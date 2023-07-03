DOME_BASE=`cd $(dirname $0); cd ..; pwd`
. $DOME_BASE/common/common.sh

clone_my_remote_repository() {
    if [ $# -lt 2 ]; then
        echo 'usage: cl <remote> <repo>'
        exit 1
        return
    fi

    local remote=$1
    local repo=$2
    # echo $remote $repo

    if [ X"$remote" == X"github" ]; then
        dome_exec dm git-clone-repository-to-local git@github.com:Jeanhwea/${repo}.git
    elif [ X"$remote" == X"mtiisl" ]; then
        local url=ssh://git@mtiisl.cn:2222/hujinghui/${repo}.git
        if [[ X"$repo" == *'/'* ]]; then
            url=ssh://git@mtiisl.cn:2222/${repo}.git
        fi
        dome_exec dm git-clone-repository-to-local $url
    fi
}

clone_my_remote_repository $*
