DOME_BASE=`cd $(dirname $0); cd ..; pwd`
. $DOME_BASE/common/common.sh

# mysql
export PATH="/opt/mysql/bin:$PATH"
export MYSQL_HOME="/opt/mysql"

# postgres
export PGDATA="/opt/pgsql/data"
export PATH="/opt/pgsql/bin:$PATH"
