DOME_PUMS_SCRIPT_DIR=$HOME/work/pums/script_tools

gotest_run_testcase() {
    local dir=$1
    local testcase=$2

    cd $1 && dome_exec go test -v -count=1 -timeout=0 -run $testcase .
}

gotest_run_pums_testcase() {
    local dir=$DOME_PUMS_SCRIPT_DIR/run
    local testcase=$1

    gotest_run_testcase $dir $testcase
}
