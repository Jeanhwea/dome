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

        if [ X"$remote" = X"gitee" ]; then
            local url=$(git remote get-url gitee)
            local pattern2='^(http|https)://'
            if [[ $url =~ $pattern2 ]]; then
                dome_print "SKIP $remote=$url"
                continue
            fi
            local pattern3='^git.*:jeanhwea/.*'
            if [[ ! $url =~ $pattern3 ]]; then
                dome_print "SKIP $remote=$url"
                continue
            fi
        fi

        if [ X"$remote" = X"origin" ]; then
            local url=$(git remote get-url origin)
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
