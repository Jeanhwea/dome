DOME_BASE=`cd $(dirname $(readlink -f $0)); cd ..; pwd`
. $DOME_BASE/common/common.sh

dome_add_local_changes() {
    if [ "$(vcs_repository_is_clean)" == "dirty" ]; then
        dome_exec git status
    fi

    dome_exec git add .
}

dome_commit_with_timestamp() {
    local timestamp=$(date +"timestamp: %Y-%m-%d %H:%M:%S")
    dome_exec 'git commit -m ''''$timestamp'''
}

dome_auto_add_and_commit_changes() {
    dome_add_local_changes
    dome_commit_with_timestamp
}

dome_auto_add_and_commit_changes
