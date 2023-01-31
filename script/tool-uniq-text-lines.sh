DOME_BASE=`cd $(dirname $0); cd ..; pwd`
. $DOME_BASE/common/common.sh

dome_uniq_text_lines() {
    pbpaste | sed '1d' | sed '/^[[:space:]]*$/d' | sort | uniq | pbcopy
}

dome_uniq_text_lines
