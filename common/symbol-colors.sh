# Terminal Colors
CLRRED="\033[31m"
CLRGRN="\033[32m"
CLRYLW="\033[33m"
CLRBLU="\033[34m"
CLRMGA="\033[35m"
CLRRST="\033[0m"


if [ "X$SHELL" = "X/bin/bash" ]; then
    CLRRED=""
    CLRGRN=""
    CLRYLW=""
    CLRBLU=""
    CLRMGA=""
    CLRRST="
fi
