logi() {
    echo -e "$(date +'%F %T :') ${CLRGRN}$*${CLRRST}"
}

logw() {
    echo -e "$(date +'%F %T :') ${CLRYLW}$*${CLRRST}"
}

loge() {
    echo -e "$(date +'%F %T :') ${CLRRED}$*${CLRRST}"
}

declare -x -f logi
