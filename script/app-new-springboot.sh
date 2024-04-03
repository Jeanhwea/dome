DOME_BASE=`cd $(dirname $0); cd ..; pwd`
. $DOME_BASE/common/common.sh

dome_new_app_springboot() {
    local app="myapp"
    if [ $# -gt 0 ]; then
        local app=$1
    fi

    dome_exec spring init \
              --name="$app" \
              --artifact-id="$app" \
              --group-id=io.github.jeanhwea \
              --dependencies=web \
              --build=maven \
              --language=java \
              --packaging=jar \
              --java-version=1.8 \
              --version=0.0.1 \
              $app

    # dome_exec "cd $app && sed -i '14,20s/>1.7</>1.8</g' pom.xml"

    dome_exec "cd $app && echo target/* >> .gitignore"
    dome_exec "cd $app && echo idea/*   >> .gitignore"
    dome_exec "cd $app && echo *.iml    >> .gitignore"
    dome_exec "cd $app && echo log/*    >> .gitignore"

    dome_exec "cd $app && git init && git add . && git commit -m init"
}

dome_new_app_springboot $*
