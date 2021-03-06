DOME_COLOR_ECHO="echo"

if [ X"$DOME_COLOR" = X"yes" ]; then
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
    $DOME_COLOR_ECHO "=> ${CLRYLW}$cmd${CLRRST}"
    bash -c "$cmd"
}

dome_exec_local() {
    local file=$1
    if [ ! -f $file ]; then
        exit 2
    fi

    bash -c "$*"
}
