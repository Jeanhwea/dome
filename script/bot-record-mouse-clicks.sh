DOME_BASE=`cd $(dirname $(readlink -f $0)); cd ..; pwd`
. $DOME_BASE/common/common.sh


gotest_run_renyin_testcase() {
    local dir=$HOME/code/jeanhwea/renyin/run
    local testcase=$1

    # gotest_run_testcase $dir $testcase 2>/dev/null | egrep -h "RecordMouseAction|SaveTextToFile"
    gotest_run_testcase $dir $testcase
}

gotest_run_renyin_testcase TestBotScripts01_RecordMouseAction
