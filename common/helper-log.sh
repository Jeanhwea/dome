DOME_COLOR_ECHO="echo"

if [ "X$SHELL" = "X/bin/bash" ]; then
    DOME_COLOR_ECHO="echo -e"
fi

logi() {
    $DOME_COLOR_ECHO "$(date +'%F %T:') ${CLRGRN}$*${CLRRST}"
}

logw() {
    $DOME_COLOR_ECHO "$(date +'%F %T:') ${CLRYLW}$*${CLRRST}"
}

loge() {
    $DOME_COLOR_ECHO "$(date +'%F %T:') ${CLRRED}$*${CLRRST}"
}

dome_exec() {
    local cmd=$*
    $DOME_COLOR_ECHO "==> ${CLRYLW}$cmd${CLRRST}"
    $cmd
}
