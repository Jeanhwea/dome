DOME_BASE=`cd $(dirname $0); cd ..; pwd`
. $DOME_BASE/common/common.sh

clone_my_remote_repository() {
    if [ $# -lt 2 ]; then
        echo 'usage: cl <remote> <repo>'
        echo '          remote := github | mtiisl | avic | gitana'
        echo '          repo is a repository name, rust_tutor or os/linux etc.'
        exit 1
        return
    fi

    local remote=$1
    local repo=$2
    # echo $remote $repo

    case "$remote" in
        github )
            dome_exec dm git-clone-repository-to-local git@github.com:Jeanhwea/${repo}.git;;
        mtiisl )
            clone_my_mtiisl_repository $repo;;
        avic )
            clone_my_avic_repository $repo;;
        gitana )
            clone_my_gitana_repository $repo;;
        * )
            echo "remote [$remote] not found!"
            exit 1;;
    esac
}

clone_my_mtiisl_repository() {
    local repo=$1

    local url=ssh://git@mtiisl.cn:2222/hujinghui/${repo}.git
    if [[ X"$repo" == *'/'* ]]; then
        url=ssh://git@mtiisl.cn:2222/${repo}.git
    fi
    dome_exec dm git-clone-repository-to-local $url
}

clone_my_avic_repository() {
    local repo=$1

    local url=ssh://git@192.168.0.202:2222/hujinghui/${repo}.git
    if [[ X"$repo" == *'/'* ]]; then
        url=ssh://git@192.168.0.202:2222/${repo}.git
    fi
    dome_exec dm git-clone-repository-to-local $url
}

clone_my_gitana_repository() {
    local repo=$1

    local url=git@gitana.jeanhwea.io:hujinghui/${repo}.git
    if [[ X"$repo" == *'/'* ]]; then
        url=git@gitana.jeanhwea.io:${repo}.git
    fi
    dome_exec dm git-clone-repository-to-local $url
}

clone_my_remote_repository $*
