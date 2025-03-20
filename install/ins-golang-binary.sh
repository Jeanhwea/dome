# DOME_BASE=`cd $(dirname $0); cd ..; pwd`
# . $DOME_BASE/common/common.sh

cd ~/down

wget -c https://go.dev/dl/go1.22.8.linux-amd64.tar.gz

tar xzvf go1.22.8.linux-amd64.tar.gz

sudo mv go /usr/local
