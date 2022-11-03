DOME_BASE=`cd $(dirname $0); cd ..; pwd`
. $DOME_BASE/common/common.sh

dome_tmux_create_or_attach() {
    local session=$(hostname | cut -c -8)
    local session=${session:-Work}
    tmux new-session -A -s $session
}

dome_tmux_create_or_attach $*
