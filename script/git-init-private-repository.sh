DOME_BASE=`cd $(dirname $(readlink -f $0)); cd ..; pwd`
. $DOME_BASE/common/common.sh

PRIVATE_USER=${PRIVATE_USER:="root"}
PRIVATE_HOST=${PRIVATE_HOST:="localhost"}
PRIVATE_PORT=${PRIVATE_PORT:="22"}

make_private_url() {
    local repodir=$1
    local reponame=$2
    local url="ssh://${PRIVATE_HOST}:${PRIVATE_PORT}/${repodir}/${reponame}.git"
}

get_remote_repodir() {
    echo ssh ${PRIVATE_USER}@${PRIVATE_HOST}:${PRIVATE_PORT} echo '$HOME'
}

get_remote_repodir
