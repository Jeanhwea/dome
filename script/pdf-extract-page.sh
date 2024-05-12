DOME_BASE=`cd $(dirname $0); cd ..; pwd`
. $DOME_BASE/common/common.sh

# https://www.pdflabs.com/docs/pdftk-cli-examples/

dome_pdf_extract_page() {
    local fin="in.pdf"
    local from="1"
    local to="1"
    local fout="output.pdf"

    if [ $# -gt 2 ]; then
        local fin=$1
        local from=$2
        local to=$3
    elif [ $# -gt 1 ]; then
        local fin=$1
        local from=$2
        local to=$2
    elif [ $# -gt 0 ]; then
        local fin=$1
    else
        echo "need args: input-file-name.pdf page-number-from page-number-to"
        exit
    fi

    dome_exec pdftk "$fin" cat "$from-$to" output "$fout"

    echo "Save to $fout"
}

dome_pdf_extract_page $*
