DOME_BASE=`cd $(dirname $0); cd ..; pwd`
. $DOME_BASE/common/common.sh

dome_pull_all_repository() {
    local base=${1:-$HOME/work}
    for repo in `find $base -type d -iname '.git' -maxdepth 3`; do
        # local dir=`dirname $repo`
        local dir=${repo///.git/}
        dome_exec git -C $dir status
        dome_exec git -C $dir pull
    done
}

dome_pull_all_repository $*
