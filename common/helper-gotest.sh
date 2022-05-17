gotest_run_testcase() {
    local dir=$1
    local testcase=$2
    # local args=${*:3}

    cd $1
    dome_exec go test -v -count=1 -timeout=0 -run $testcase .
}
