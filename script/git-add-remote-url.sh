DOME_BASE=`cd $(dirname $0); cd ..; pwd`
. $DOME_BASE/common/common.sh

add_remote_url() {
    local remote=$1
    local dir=$PWD
    local up1=$(dirname $dir)
    local up2=$(dirname $up1)
    local repo=$(basename $dir)
    local group=$(basename $up1)

    # echo $repo $group
    case "$remote" in
        github )
            if [ X"$group" == X"jeanhwea" ]; then
                dome_exec git remote add github git@github.com:Jeanhwea/${repo}.git
            else
                dome_exec git remote add github https://githubfast.com/${group}/${repo}.git
            fi;;
        gitana )
            if [ X"$group" == X"jeanhwea" ]; then
                dome_exec git remote add gitana git@gitana.jeanhwea.io:hujinghui/${repo}.git
            else
                dome_exec git remote add gitana git@gitana.jeanhwea.io:${group}/${repo}.git
            fi;;
        * )
            echo "remote [$remote] not found!"
            exit 1;;
    esac
}

add_remote_url $*
