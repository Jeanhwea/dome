DOME_BASE=`cd $(dirname $(readlink -f $0)); cd ..; pwd`
. $DOME_BASE/common/common.sh

make_private_url() {
    local repodir=$1
    local reponame=$2
    local url="ssh://${PRIVATE_HOST}:${PRIVATE_POST}/${repodir}/${reponame}.git"
}
