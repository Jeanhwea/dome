DOME_BASE=`cd $(dirname $(readlink -f $0)); cd ..; pwd`
. $DOME_BASE/common/common.sh

PRIVATE_USER=${PRIVATE_USER:="root"}
PRIVATE_HOST=${PRIVATE_HOST:="private.host"}
PRIVATE_PORT=${PRIVATE_PORT:="22"}

get_remote_basedir() {
    ssh -p ${PRIVATE_PORT} ${PRIVATE_USER}@${PRIVATE_HOST} 'echo "$HOME/repo"'
}

build_private_url() {
    local repodir=$1
    local reponame=$2
    local url="ssh://${PRIVATE_USER}@${PRIVATE_HOST}:${PRIVATE_PORT}${repodir}/${reponame}.git"
    echo $url
}

make_private_url() {
    local basedir=$(get_remote_basedir)
    local repodir="${basedir}/$1"
    local reponame=$2
    build_private_url $repodir $reponame
}

setup_remote_repo() {
    local basedir=$(get_remote_basedir)
    local repodir="$1"
    local reponame="$2"
    local repo="${basedir}/${repodir}/${reponame}.git"
    dome_exec ssh -p ${PRIVATE_PORT} ${PRIVATE_USER}@${PRIVATE_HOST} "\"mkdir -p $repo && git -C $repo init --bare\""
    if [ $? -ne 0 ]; then
        loge "Failed init repository $repo"
        exit 1
    fi

    local url=$(make_private_url $repodir $reponame)
    logi "git clone -o private $url"
    logi "git add remote private $url"
}

init_remote_private_repo() {
    local repodir="jeanhwea"
    local reponame=$1

    if [ $# -gt 1 ]; then
        local repodir=$1
        local reponame=$2
    fi

    setup_remote_repo $repodir $reponame
}

init_remote_private_repo $*
