DOME_BASE=`cd $(dirname $0); cd ..; pwd`
. $DOME_BASE/common/common.sh

# https://www.pdflabs.com/docs/pdftk-cli-examples/

dome_pdf_crop_page() {
    local fin="in.pdf"
    # "left top right bottom"
    local margins="5 50 2 20"
    local fout="output.pdf"

    if [ $# -gt 1 ]; then
        local fin=$1
        shift 1
        local margins=$*
    elif [ $# -gt 0 ]; then
        local fin=$1
    else
        echo "need args: input-file-name.pdf margins(left,top,right,bottom)"
        exit
    fi

    dome_exec pdfcrop --margins "'$margins'" "$fin" "$fout"

    echo "Save to $fout"
}

dome_pdf_crop_page $*
