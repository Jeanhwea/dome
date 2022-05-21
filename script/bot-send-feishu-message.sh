DOME_BASE=`cd $(dirname $(readlink -f $0)); cd ..; pwd`
. $DOME_BASE/common/common.sh

gotest_run_renyin_testcase() {
    local dir=$HOME/code/jeanhwea/renyin
    local testcase=$1

    local name="bot-message-list"
    if [ $# -ge 2 ]; then
        local name=${2/.csv/}
    fi

    cd $dir
    dome_exec CGO_ENABLED=1 go test -v -count=1 -timeout=0 -run $testcase ./run -args "${name}.csv"
}

gotest_run_renyin_testcase TestFeishuScripts01_SendMessage $*
