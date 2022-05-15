DOME_BASE=`cd $(dirname $(readlink -f $0)); cd ..; pwd`
. $DOME_BASE/common/common.sh


test_match_github() {
    local url=$1

    # match git@github.com:Jeanhwea/dome.git
    local pattern='^git@github.com:([_0-9a-zA-Z-]+)/([_0-9a-zA-Z-]+).git$'
    if [[ $url =~ $pattern ]]; then
        echo "github" ${BASH_REMATCH[1]} ${BASH_REMATCH[2]}
    fi

    # match https://github.com/go-vgo/robotgo.git
    local pattern='^https://github.com/([_0-9a-zA-Z-]+)/([_0-9a-zA-Z-]+).git$'
    if [[ $url =~ $pattern ]]; then
        echo "github" ${BASH_REMATCH[1]} ${BASH_REMATCH[2]}
    fi
}

test_match_github "git@github.com:Jeanhwea/dome.git"
test_match_github "https://github.com/go-vgo/robotgo.git"
