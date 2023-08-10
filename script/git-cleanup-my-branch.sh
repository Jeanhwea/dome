DOME_BASE=`cd $(dirname $0); cd ..; pwd`
. $DOME_BASE/common/common.sh

dome_get_remote_name() {
    git remote
}

dome_sync_remote_branch() {
    local origin=$(dome_get_remote_name)
    for origin in $(dome_get_remote_name); do
        logi "fetch branch from $origin"
        git fetch $origin --prune
    done
}

dome_delete_local_merged_branch() {
    if [ X"$(vcs_repository_is_clean)" = X"dirty" ]; then
        dome_exec git status
        return
    fi

    for origin in $(dome_get_remote_name); do
        logw "delete local branch from $origin"
        local branches=$(git branch --merged | egrep -v "(^\*|master|main|dev)" | grep 'jh/')
        for branch in ${branches[@]}; do
            dome_exec git branch -d $branch
        done
    done
}

dome_delete_remote_merged_branch() {
    if [ X"$(vcs_repository_is_clean)" = X"dirty" ]; then
        dome_exec git status
        return
    fi

    for origin in $(dome_get_remote_name); do
        logw "delete remote branch on $origin"
        local branches=$(git branch -r --merged | egrep -v "(^\*|master|main|dev)" | sed "s#${origin}/##;s# ##" | grep 'jh/')
        for branch in ${branches[@]}; do
            dome_exec git push $origin :$branch
        done
    done
}

dome_sync_remote_branch
dome_delete_local_merged_branch
dome_delete_remote_merged_branch
