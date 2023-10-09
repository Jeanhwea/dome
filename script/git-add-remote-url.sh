DOME_BASE=`cd $(dirname $0); cd ..; pwd`
. $DOME_BASE/common/common.sh

add_my_remote_url() {
    if [ $# -lt 2 ]; then
        echo 'usage: ra <remote> <repo>'
        echo '          remote := mtiisl | avic | gitana'
        echo '          repo is a repository name, rust_tutor or os/linux etc.'
        exit 1
        return
    fi

    local remote=$1
    local repo=$2
    # echo $remote $repo

    case "$remote" in
        mtiisl )
            add_my_mtiisl_url $repo;;
        avic )
            add_my_avic_url $repo;;
        gitana )
            add_my_gitana_url $repo;;
        * )
            echo "remote [$remote] not found!"
            exit 1;;
    esac
}

add_my_mtiisl_url() {
    local repo=$1

    local url=ssh://git@mtiisl.cn:2222/hujinghui/${repo}.git
    if [[ X"$repo" == *'/'* ]]; then
        url=ssh://git@mtiisl.cn:2222/${repo}.git
    fi
    dome_exec git remote add mtiisl $url
}

add_my_avic_url() {
    local repo=$1

    local url=ssh://git@192.168.0.202:2222/hujinghui/${repo}.git
    if [[ X"$repo" == *'/'* ]]; then
        url=ssh://git@192.168.0.202:2222/${repo}.git
    fi
    dome_exec git remote add avic $url
}

add_my_gitana_url() {
    local repo=$1

    local url=git@gitana.jeanhwea.io:hujinghui/${repo}.git
    if [[ X"$repo" == *'/'* ]]; then
        url=git@gitana.jeanhwea.io:${repo}.git
    fi
    dome_exec git remote add gitana $url
}

add_my_remote_url $*
