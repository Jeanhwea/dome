DOME_BASE=`cd $(dirname $0); cd ..; pwd`
. $DOME_BASE/common/common.sh

dome_get_remote_name() {
    git remote
}

dome_delete_local_merged_branch() {
    if [ X"$(vcs_repository_is_clean)" = X"dirty" ]; then
        dome_exec git status
        return
    fi

    local origin=$(dome_get_remote_name)
    local branches=$(git branch --merged | egrep -v "(^\*|master|main|dev)" | grep 'jh/')
    for branch in ${branches[@]}; do
        dome_exec git branch -d $branch
    done
}

dome_delete_remote_merged_branch() {
    if [ X"$(vcs_repository_is_clean)" = X"dirty" ]; then
        dome_exec git status
        return
    fi

    local origin=$(dome_get_remote_name)
    local branches=$(git branch -r --merged | egrep -v "(^\*|master|main|dev)" | sed "s#${origin}/##;s# ##" | grep 'jh/')
    for branch in ${branches[@]}; do
        dome_exec git push $origin :$branch
    done
}

dome_delete_local_merged_branch
dome_delete_remote_merged_branch
