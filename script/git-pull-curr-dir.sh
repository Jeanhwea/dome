DOME_BASE=`cd $(dirname $0); cd ..; pwd`
. $DOME_BASE/common/common.sh

dome_pull_all_repositories() {
    local base=${1:-$PWD}
    for repo in `find $base -maxdepth 3 -type d -iname '.git'`; do
        # local dir=`dirname $repo`
        local dir=${repo///.git/}
        dome_exec git -C $dir remote -v
        dome_exec git -C $dir status
        dome_exec git -C $dir pull
        dome_exec git -C $dir submodule update
    done
}

dome_pull_all_repositories $*
