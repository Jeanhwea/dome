DOME_BASE=`cd $(dirname $0); cd ..; pwd`


for script in $(find "$DOME_BASE/common" -maxdepth 1 -name 'symbol*.sh' | sort); do
    . $script
    [ "$?" != "0" ] && exit 1
done


for script in $(find "$DOME_BASE/common" -maxdepth 1 -name 'helper*.sh' | sort); do
    . $script
    [ "$?" != "0" ] && exit 1
done
