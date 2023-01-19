DOME_BASE=`cd $(dirname $0); cd ..; pwd`
. $DOME_BASE/common/common.sh


upgrade_dome_package_version() {
    local proj=$(git rev-parse --show-toplevel)
    local file="$proj/common/symbol-meta.sh"
    local curr=$1
    if [ -f $file ]; then
        sed -i 's/DOME_VERSION=.*/DOME_VERSION="'$curr'"/' $file
        dome_exec git add $file
        dome_exec git commit -m "$curr"
    fi
}

upgrade_kitex_package_version() {
    local proj=$(git rev-parse --show-toplevel)
    local file="$proj/symbol/meta_info.go"
    local curr=$1
    if [ -f $file ]; then
        sed -i -E 's/(Version += +")v.*(")/\1'$curr'\2/' $file
        dome_exec git add $file
        dome_exec git commit -m "$curr"
    fi
}

upgrade_maven_package_version() {
    local proj=$(git rev-parse --show-toplevel)
    local file="$proj/pom.xml"
    local curr=$1
    if [ -f $file ]; then
        sed -i -E '1,10s#<version>[0-9.]+</version>#<version>'${curr/v/}'</version>#' $file
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
    local last=$(vcs_last_version)
    local curr=$(vcs_bomup_version $last $count)
    logi "upgrade $last -> $curr"

    # 检测当前 git 代码仓库是否干净
    if [ X"$(vcs_repository_is_clean)" = X"dirty" ]; then
        dome_exec git status
    fi

    # 检测是否在 master 分支上
    local branch=$(git rev-parse --abbrev-ref HEAD)
    if [ X"$branch" != X"master" ]; then
        loge "Only support on master branch, but got $branch, ABORT!"
        exit 1
    fi

    # 检查 last 是否和 HEAD 相同, 避免重复打 tag
    local head=$(git rev-parse HEAD)
    local hash=$(git rev-parse $last)
    if [ X"$hash" = X"$head" ]; then
        loge "Current HEAD has already tagged, ABORT!"
        exit 1
    fi

    # 进行升级工作
    upgrade_dome_package_version $curr
    upgrade_kitex_package_version $curr
    upgrade_maven_package_version $curr

    # 将版本同步到远端
    dome_exec git push
    dome_exec git tag $curr
    dome_exec git push --tags
}

dome_upgrade_semantic_version $*
