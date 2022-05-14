DOME_BASE=`cd $(dirname $(readlink -f $0)); cd ..; pwd`

for script in $(find "$DOME_BASE/common" -maxdepth 1 -name 'symbol-*.sh' | sort); do
    . $script
    if [ $? -ne 0 ]; then
        echo "fail to source $script"
        exit 1
    fi
done


for script in $(find "$DOME_BASE/common" -maxdepth 1 -name 'helper-*.sh' | sort); do
    . $script
    if [ $? -ne 0 ]; then
        echo "fail to source $script"
        exit 1
    fi
done
