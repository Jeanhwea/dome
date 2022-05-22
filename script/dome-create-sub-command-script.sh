DOME_BASE=`cd $(dirname $0); cd ..; pwd`
. $DOME_BASE/common/common.sh


dome_create_subcmd_script() {
    local subcmd=${1/.sh/}
    local file="$DOME_BASE/script/$subcmd.sh"
    if [ -f $file ]; then
        logw "file $file already exists"
    else
        cp $DOME_BASE/script/dome-create-sub-command-script.sh $file && \
            sed -i '3,$d' $file
        logi "create file $file"
    fi
}

dome_create_subcmd_script $*
