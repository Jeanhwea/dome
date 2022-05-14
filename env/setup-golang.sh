DOME_BASE=`cd $(dirname $(readlink -f $0)); cd ..; pwd`
. $DOME_BASE/common/common.sh

# golang
export GOROOT=${GOROOT:-/usr/local/go}
export GOPATH=${GOPATH:-$HOME/go}
export CGO_ENABLED=1

export PATH="$GOROOT/bin:$PATH"
