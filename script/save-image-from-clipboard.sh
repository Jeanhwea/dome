DOME_BASE=`cd $(dirname $0); cd ..; pwd`
. $DOME_BASE/common/common.sh

save_image_from_clipboard() {
    local proj=$(git rev-parse --show-toplevel)
    local shim=$(date +"static/image/%Y/%m%d")
    local name=$(date +"%H%M%S.png")


    local dir="$proj/$shim"
    [ -d $dir ] || mkdir -p $dir

    local file="$dir/$name"

    pngpaste $file

    echo "[[file:../$shim/$name]]" | pbcopy
}

save_image_from_clipboard $*
