DOME_BASE=`cd $(dirname $0); cd ..; pwd`
. $DOME_BASE/common/common.sh

dome_push_all_remotes() {
    for remote in `git remote`; do
        if [ X"$remote" = X"github" ]; then
            local url=$(git remote get-url github)
            local pattern2='^(http|https)://'
            if [[ $url =~ $pattern2 ]]; then
                dome_print "SKIP $remote=$url"
                continue
            fi
        fi

        dome_exec git push $remote --all
        dome_exec git push $remote --tags
    done
}

dome_push_all_remotes $*
