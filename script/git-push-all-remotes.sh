DOME_BASE=`cd $(dirname $0); cd ..; pwd`
. $DOME_BASE/common/common.sh

dome_push_all_remotes() {
    for remote in `git remote`; do
        dome_exec git push $remote --all
        dome_exec git push $remote --tags
    done
}

dome_push_all_remotes $*
