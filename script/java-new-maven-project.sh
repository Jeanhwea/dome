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

    dome_exec "cd $app && sed -i '14,20s/>1.7</>1.8</g' pom.xml"

    dome_exec "cd $app && echo target/* >> .gitignore"
    dome_exec "cd $app && echo idea/*   >> .gitignore"
    dome_exec "cd $app && echo *.iml    >> .gitignore"
    dome_exec "cd $app && echo log/*    >> .gitignore"

    dome_exec "cd $app && git init && git add . && git commit -m init"
}

dome_new_maven_project $*
