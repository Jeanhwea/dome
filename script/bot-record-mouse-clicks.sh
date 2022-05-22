DOME_BASE=`cd $(dirname $0); cd ..; pwd`
. $DOME_BASE/common/common.sh


gotest_run_renyin_testcase() {
    local dir=$HOME/code/jeanhwea/renyin
    local testcase=$1

    local macro="mouse-click-record"
    if [ $# -ge 2 ]; then
        local macro=${2/.json/}
    fi

    cd $dir
    dome_exec CGO_ENABLED=1 go test -v -count=1 -timeout=0 -run $testcase ./run -args "bot/${macro}.json"
}

gotest_run_renyin_testcase TestBotScripts01_RecordMouseAction $*
