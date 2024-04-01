DOME_BASE=`cd $(dirname $0); cd ..; pwd`
. $DOME_BASE/common/common.sh

# mysql
export PATH="/opt/mysql/bin:$PATH"

# postgres
export PGDATA="/opt/pgsql/data"
export PATH="/opt/pgsql/bin:$PATH"
