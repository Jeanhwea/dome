#!/usr/bin/env bash
DOME_BASE=`cd $(dirname $0); cd ..; pwd`
. $DOME_BASE/common/common.sh

DOWNLINK=https://www.eclipse.org/downloads/download.php?file=/jdtls/milestones/1.39.0/jdt-language-server-1.39.0-202408291433.tar.gz
TARBALL=jdt-language-server-1.39.0-202408291433.tar.gz
JDTDIR=~/bin/jdt
JDTBIN=~/bin/jdtls

cd /tmp

echo "download from $DOWNLINK"
curl -sL --output $TARBALL "$DOWNLINK"
ERRCODE=$?
if [ "$ERRCODE" != "0" ]; then
  echo "fail to download file, errno=$ERRCODE"
  exit $ERRCODE
fi

mkdir -p $JDTDIR
cd $JDTDIR
tar xzvf /tmp/$TARBALL

cat > $JDTBIN <<\EOF
#!/usr/bin/env sh
export JAVA_HOME=$JAVA_HOME
export PATH=$JAVA_HOME/bin:$PATH

exec $HOME/bin/jdt/bin/jdtls $*
EOF

chmod +x $JDTBIN
