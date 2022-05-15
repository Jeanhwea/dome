DOME_BASE=`cd $(dirname $(readlink -f $0)); cd ..; pwd`
. $DOME_BASE/common/common.sh


for script in $(find "$DOME_BASE/env" -maxdepth 1 -name 'setup*.sh' | sort); do
    . $script
    if [ $? -ne 0 ]; then
        echo "fail to source $script"
        exit 1
    fi
done

export PATH="${DOME_BASE}/bin:$PATH"
