DOME_BASE=`cd $(dirname $0); cd ..; pwd`
. $DOME_BASE/common/common.sh

dome_new_app_nextjs() {
    local app="app01"
    if [ $# -gt 0 ]; then
        local app=$1
    fi

    dome_exec npx create-next-app@latest "$app"

    # dome_exec "cd $app && git init && git add . && git commit -m init"
}

dome_new_app_nextjs $*
