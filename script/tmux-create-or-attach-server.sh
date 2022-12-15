DOME_BASE=`cd $(dirname $0); cd ..; pwd`
. $DOME_BASE/common/common.sh

dome_tmux_create_or_attach() {
    local short=$(hostname | cut -c -8)
    local short=${short:-Work}
    local session=${HOSTSHORT:=$short}
    tmux new-session -A -s $session
}

dome_tmux_create_or_attach $*
