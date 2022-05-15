DOME_BASE=`cd $(dirname $(readlink -f $0)); cd ..; pwd`
. $DOME_BASE/common/common.sh


get_last_version() {
    version=$(git tag -l 'v*' | sort -V -r | head -n 1)
    if [ "$version" == "" ]; then
        version="v0.0.0"
    fi
    echo $version
}

upgrade_dome_package_version() {
    local proj=$(git rev-parse --show-toplevel)
    local file="$proj/common/symbol-meta.sh"
    local curr=$1
    if [ -f $file ]; then
        sed -i 's/DOME_VERSION=*/DOME_VERSION="'$curr'"/' $file
        dome_exec git add $file
        dome_exec git commit -m "$curr"
    fi
}

dome_upgrade_semantic_version() {
    # 获取保留的版本数字的个数
    local count=3
    if [ $# -gt 0 ]; then
        local count=$1
    fi

    # 获取升级的版本
    local last=$(get_last_version)
    local curr=$(bomup_version $last $count)
    logi "upgrade $last -> $curr"

    # 检测当前 git 是否干净
    if [ X"$(git status --porcelain)" != X"" ]; then
        dome_exec git status
    fi

    # 检测是否在 master 分支上
    local branch=$(git rev-parse --abbrev-ref HEAD)
    if [ "$branch" != "master" ]; then
        loge "Only support on master branch, but got $branch, ABORT!"
        exit 1
    fi

    # 检查 last 是否和 HEAD 相同, 避免重复打 tag
    local head=$(git rev-parse HEAD)
    local hash=$(git rev-parse $last)
    if [ "$hash" = "$head" ]; then
        loge "Already tagged to $curr, ABORT!"
        exit 1
    fi

    # 进行升级工作
    upgrade_dome_package_version $curr

    # 将版本同步到远端
    dome_exec git push
    dome_exec git tag $curr
    dome_exec git push --tags
}

dome_upgrade_semantic_version
