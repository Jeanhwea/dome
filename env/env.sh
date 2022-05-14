DOME_BASE=`cd $(dirname $(readlink -f $0)); cd ..; pwd`
. $DOME_BASE/common/common.sh

for script in $(find "$DOME_BASE/env" -maxdepth 1 -name 'setup*.sh' | sort); do
    . $script
    [ "$?" != "0" ] && exit 1
done
