DOME_BASE=`cd $(dirname $(readlink -f $0)); cd ..; pwd`
. $DOME_BASE/common/common.sh


gotest_run_pums_testcase() {
    local dir=$HOME/work/pums/script_tools/run
    local testcase=$1

    gotest_run_testcase $dir $testcase 2>/dev/null | grep "RecordMouseAction"
}

gotest_run_pums_testcase TestBotCommonScripts01_RecordMouseAction
