DOME_BASE=`cd $(dirname $0); cd ..; pwd`
. $DOME_BASE/common/common.sh

# dome
export PATH="$DOME_BASE/bin:$PATH"

# mysql
export PATH="/opt/local/mysql/bin:$PATH"

# postgres
export PGDATA="/opt/local/pgsql/data"
export PATH="/opt/local/pgsql/bin:$PATH"
