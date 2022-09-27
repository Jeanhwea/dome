DOME_BASE=`cd $(dirname $0); cd ..; pwd`
. $DOME_BASE/common/common.sh


dome_format_golans_source() {
    local files=$(find . -iname '*.go' -not -path "./*_gen/*" -and -not -path './model/base/*.go' -and -not -path '*_gen.go')
    for file in ${files[@]}; do
        logi "format $file"
        dome_exec "sed -i '/^import (/,/^\s*)/ { /^\s*$/ d; }' $file"
        dome_exec "goimports -w $file"
    done
}

dome_format_golans_source $*
