DOME_BASE=`cd $(dirname $0); cd ..; pwd`
. $DOME_BASE/common/common.sh

dome_pull_all_repositories() {
    local base=${1:-$DOME_CODE_DIR}
    for repo in `find $base -maxdepth 4 -type d -iname '.git'`; do
        # local dir=`dirname $repo`
        local dir=${repo///.git/}
        dome_exec git -C $dir remote -v
        dome_exec git -C $dir status
        dome_exec git -C $dir fetch
    done
}

dome_pull_all_repositories $*
