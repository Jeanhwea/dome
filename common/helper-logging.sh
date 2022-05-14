logi() {
    if [ "$SHELL" == "/bin/bash" ]; then
        echo -e "$(date +'%F %T:') ${CLRGRN}$*${CLRRST}"
    else
        echo "$(date +'%F %T:') ${CLRGRN}$*${CLRRST}"
    fi
}

logw() {
    if [ "$SHELL" == "/bin/bash" ]; then
        echo -e "$(date +'%F %T:') ${CLRYLW}$*${CLRRST}"
    else
        echo "$(date +'%F %T:') ${CLRYLW}$*${CLRRST}"
    fi
}

loge() {
    if [ "$SHELL" == "/bin/bash" ]; then
        echo -e "$(date +'%F %T:') ${CLRRED}$*${CLRRST}"
    else
        echo "$(date +'%F %T:') ${CLRRED}$*${CLRRST}"
    fi
}
