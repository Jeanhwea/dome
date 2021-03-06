DOME_BASE=`cd $(dirname $0); cd ..; pwd`
. $DOME_BASE/common/common.sh

gotest_run_renyin_testcase() {
    local dir=$HOME/code/jeanhwea/renyin
    local testcase=$1

    local msgname="bot-message-list"
    if [ $# -ge 2 ]; then
        local msgname=${2/.csv/}
    fi

    cd $dir
    dome_exec CGO_ENABLED=1 go test -v -count=1 -timeout=0 -run $testcase ./run -args "${msgname}.csv"
}

gotest_run_renyin_testcase TestFeishuScripts01_SendMessage $*
