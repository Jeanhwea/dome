DOME_BASE=`cd $(dirname $0); cd ..; pwd`
. $DOME_BASE/common/common.sh

clone_my_github_repository() {
    local repo=$1
    dome git-clone-repository-to-local git@github.com:Jeanhwea/${repo}.git
}

clone_my_github_repository $*
