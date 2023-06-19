DOME_BASE=`cd $(dirname $0); cd ..; pwd`
. $DOME_BASE/common/common.sh

clone_my_github_repository() {
    if [ $# -lt 1 ]; then
        echo 'usage: clg <repo>'
        exit 1
        return
    fi

    local repo=$1
    dome_exec dm git-clone-repository-to-local git@github.com:jeanhwea/${repo}.git
}

clone_my_github_repository $*
