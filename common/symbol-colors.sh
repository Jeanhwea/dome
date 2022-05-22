# Terminal Colors
CLRRED=""
CLRGRN=""
CLRYLW=""
CLRBLU=""
CLRMGA=""
CLRRST=""

if [ X"$DOME_COLOR" = X"yes" ]; then
    CLRRED="\033[31m"
    CLRGRN="\033[32m"
    CLRYLW="\033[33m"
    CLRBLU="\033[34m"
    CLRMGA="\033[35m"
    CLRRST="\033[0m"
fi
