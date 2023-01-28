DOME_BASE=`cd $(dirname $0); cd ..; pwd`
. $DOME_BASE/common/common.sh
DOME_GIT_EMAIL='hujinghui@buaa.edu.cn'

dome_find_git_dir() {
    local dir=$1
    find $1 -maxdepth 4 -type d -iname '.git' | sed 's#/.git##'
}

dome_setup_user_email() {
    for repo in $(dome_find_git_dir ~/code); do
        local curr_email=$(git -C $repo config --get user.email)
        if [ X"$DOME_GIT_EMAIL" != X"$curr_email" ]; then
            dome_exec git -C $repo config user.email $DOME_GIT_EMAIL
        fi
    done
}

dome_setup_user_email
