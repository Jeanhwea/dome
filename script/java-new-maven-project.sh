DOME_BASE=`cd $(dirname $0); cd ..; pwd`
. $DOME_BASE/common/common.sh

dome_new_maven_project() {
    local app="app01"
    if [ $# -gt 0 ]; then
        local app=$1
    fi

    dome_exec mvn archetype:generate \
              -DartifactId="$app" \
              -DgroupId=io.github.jeanhwea \
              -DarchetypeArtifactId=maven-archetype-quickstart \
              -Dversion=0.0.1 \
              -DarchetypeVersion=1.4 \
              -DinteractiveMode=false
}

dome_new_maven_project $*
