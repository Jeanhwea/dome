DOME_BASE=`cd $(dirname $(readlink -f $0)); cd ..; pwd`
. $DOME_BASE/common/common.sh

# golang
export GOROOT=${GOROOT:-/usr/local/go}
export GOPATH=${GOPATH:-$HOME/go}

# https://goproxy.cn/
export GO111MODULE=${GO111MODULE:=on}
export GOPROXY=${GOPROXY:=https://goproxy.cn|direct}
export CGO_ENABLED=1

export PATH="$GOROOT/bin:$PATH"