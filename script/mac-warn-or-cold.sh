DOME_BASE=`cd $(dirname $0); cd ..; pwd`
. $DOME_BASE/common/common.sh

mac_warn_or_cold() {
    local count=$(pgrep '^yes' | wc -l)
    if [ $count -gt 0 ]; then
        for i in $(seq `sysctl -n hw.ncpu`); do
            yes > /dev/null &
        done
    else
        pkill -9 '^yes'
    fi
}

mac_warn_or_cold $*
