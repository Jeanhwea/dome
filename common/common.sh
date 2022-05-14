HERE=`cd $(dirname $0); pwd`
DOME_BASE=`cd $(dirname $0); cd ..; pwd`

for script in $(find "$HERE" -maxdepth 1 -name 'symbol*.sh' | sort); do
  source "$script"
  [ "$?" != "0" ] && exit 1
done
