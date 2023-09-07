DOME_BASE=`cd $(dirname $0); cd ..; pwd`
. $DOME_BASE/common/common.sh


test_match_github() {
    local url=${1//.git}

    # match git@github.com:Jeanhwea/dome.git
    local pattern1='^git@github.com:([a-zA-Z0-9_-]+)/([.a-zA-Z0-9_-]+)$'
    if [[ $url =~ $pattern1 ]]; then
        echo "github" ${BASH_REMATCH[1]} ${BASH_REMATCH[2]}
    fi

    # match https://github.com/go-vgo/robotgo.git
    local pattern2='^(http|https)://github.com/([a-zA-Z0-9_-]+)/([.a-zA-Z0-9_-]+)$'
    if [[ $url =~ $pattern2 ]]; then
        echo "github" ${BASH_REMATCH[2]} ${BASH_REMATCH[3]}
    fi

    # match https://githubfast.com/go-vgo/robotgo.git
    local pattern2='^(http|https)://githubfast.com/([a-zA-Z0-9_-]+)/([.a-zA-Z0-9_-]+)$'
    if [[ $url =~ $pattern2 ]]; then
        echo "github" ${BASH_REMATCH[2]} ${BASH_REMATCH[3]}
    fi
}
# test_match_github "git@github.com:Jeanhwea/dome.git"
# test_match_github "https://github.com/go-vgo/robotgo.git"
# test_match_github "https://github.com/go-vgo/robotgo"
# test_match_github "http://github.com/go-vgo/test"

test_match_gitlab() {
    local url=${1//.git}

    # match git@gitlab.com:Jeanhwea/dome.git
    local pattern1='^git@gitlab.com:([a-zA-Z0-9_-]+)/([.a-zA-Z0-9_-]+)$'
    if [[ $url =~ $pattern1 ]]; then
        echo "gitlab" ${BASH_REMATCH[1]} ${BASH_REMATCH[2]}
    fi

    # match https://gitlab.com/go-vgo/robotgo.git
    local pattern2='^(http|https)://gitlab.com/([a-zA-Z0-9_-]+)/([.a-zA-Z0-9_-]+)$'
    if [[ $url =~ $pattern2 ]]; then
        echo "gitlab" ${BASH_REMATCH[2]} ${BASH_REMATCH[3]}
    fi
}

test_match_gitana() {
    local url=${1//.git}

    # match git@gitana.jeanhwea.io:Jeanhwea/dome.git
    local pattern1='^git@gitana.jeanhwea.io:([a-zA-Z0-9_-]+)/([.a-zA-Z0-9_-]+)$'
    if [[ $url =~ $pattern1 ]]; then
        echo "gitana" ${BASH_REMATCH[1]} ${BASH_REMATCH[2]}
    fi

    # match https://gitana.jeanhwea.io/go-vgo/robotgo.git
    local pattern2='^(http|https)://gitana.jeanhwea.io/([a-zA-Z0-9_-]+)/([.a-zA-Z0-9_-]+)$'
    if [[ $url =~ $pattern2 ]]; then
        echo "gitana" ${BASH_REMATCH[2]} ${BASH_REMATCH[3]}
    fi
}

test_match_mtiisl() {
    local url=${1//.git}

    # match ssh://git@mtiisl.cn:2222/hujinghui/worknotes.git
    local pattern1='^ssh://git@mtiisl.cn:2222/([a-zA-Z0-9_-]+)/([.a-zA-Z0-9_-]+)$'
    if [[ $url =~ $pattern1 ]]; then
        echo "mtiisl" ${BASH_REMATCH[1]} ${BASH_REMATCH[2]}
    fi

    # match http://mtiisl.cn/gitlab/hujinghui/worknotes.git
    local pattern2='^(http|https)://mtiisl.cn/gitlab/gitlab/([a-zA-Z0-9_-]+)/([.a-zA-Z0-9_-]+)$'
    if [[ $url =~ $pattern2 ]]; then
        echo "mtiisl" ${BASH_REMATCH[2]} ${BASH_REMATCH[3]}
    fi
}


# https://gitee.com/opengauss/openGauss-server.git
test_match_gitee() {
    local url=${1//.git}

    # match git@gitee.com:Jeanhwea/dome.git
    local pattern1='^git@gitee.com:([a-zA-Z0-9_-]+)/([.a-zA-Z0-9_-]+)$'
    if [[ $url =~ $pattern1 ]]; then
        echo "gitee" ${BASH_REMATCH[1]} ${BASH_REMATCH[2]}
    fi

    # match https://gitee.com/go-vgo/robotgo.git
    local pattern2='^(http|https)://gitee.com/([a-zA-Z0-9_-]+)/([.a-zA-Z0-9_-]+)$'
    if [[ $url =~ $pattern2 ]]; then
        echo "gitee" ${BASH_REMATCH[2]} ${BASH_REMATCH[3]}
    fi
}


test_match_codebase() {
    local file=$*
    dome_exec_local $HOME/bin/local/test-match-codebase.sh $file
    if [ "$?" -eq 0 ]; then
        echo "codebase"
    fi
}

clone_repository_to_local() {
    local url=$*

    local remote="none"
    local repodir=
    local reponame=

    local fields=($(test_match_github $url))
    if [ ${#fields[@]} -ge 3 ]; then
        remote=${fields[0]}
        reponame=${fields[2]}
        if [ X"${fields[1]}" = X"Jeanhwea" ]; then
            repodir="$DOME_CODE_DIR/jeanhwea"
        else
            repodir="$DOME_CODE_DIR/github/${fields[1]}"
        fi
    fi

    local fields=($(test_match_gitee $url))
    if [ ${#fields[@]} -ge 3 ]; then
        remote=${fields[0]}
        reponame=${fields[2]}
        if [ X"${fields[1]}" = X"jeanhwea" ]; then
            repodir="$DOME_CODE_DIR/jeanhwea"
        else
            repodir="$DOME_CODE_DIR/gitee/${fields[1]}"
        fi
    fi

    local fields=($(test_match_gitlab $url))
    if [ ${#fields[@]} -ge 3 ]; then
        remote=${fields[0]}
        reponame=${fields[2]}
        if [ X"${fields[1]}" = X"Jeanhwea" ]; then
            repodir="$DOME_CODE_DIR/jeanhwea"
        else
            repodir="$DOME_CODE_DIR/gitlab/${fields[1]}"
        fi
    fi

    local fields=($(test_match_gitana $url))
    if [ ${#fields[@]} -ge 3 ]; then
        remote=${fields[0]}
        reponame=${fields[2]}
        if [ X"${fields[1]}" = X"hujinghui" ]; then
            repodir="$DOME_CODE_DIR/jeanhwea"
        else
            repodir="$DOME_CODE_DIR/gitana/${fields[1]}"
        fi
    fi

    local fields=($(test_match_mtiisl $url))
    if [ ${#fields[@]} -ge 3 ]; then
        remote=${fields[0]}
        reponame=${fields[2]}
        if [ X"${fields[1]}" = X"hujinghui" ]; then
            repodir="$DOME_CODE_DIR/jeanhwea"
        else
            repodir="$DOME_CODE_DIR/mtiisl/${fields[1]}"
        fi
    fi

    if [ X"$remote" = X"none" ]; then
        fields=($(test_match_codebase $url))
        if [ ${#fields[@]} -ge 3 ]; then
            remote=${fields[0]}
            reponame=${fields[2]}
            repodir="$DOME_WORK_DIR/${fields[1]}"
        fi
    fi

    if [ X"$remote" != X"none" ]; then
        logi "Clone to $repodir/$reponame"
        (mkdir -p $repodir && cd $repodir && git clone --recurse-submodules -o $remote $url)
    else
        if [ $# -ge 2 ]; then
            remote=$2
            (git clone --recurse-submodules -o $remote $url)
        fi
        logw "Unknown URL: $url"
    fi
}

clone_repository_to_local $*
