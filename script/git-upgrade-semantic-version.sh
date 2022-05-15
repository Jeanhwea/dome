DOME_BASE=`cd $(dirname $(readlink -f $0)); cd ..; pwd`
. $DOME_BASE/common/common.sh


get_last_version() {
    version=$(git tag -l 'v*' | sort -V -r | head -n 1)
    if [ "$version" == "" ]; then
        version="v0.0.0"
    fi
    echo $version
}

detect_and_upgrade_package_version() {
    local proj=$(git rev-parse --show-toplevel)
    local file="$proj/common/symbol-meta.sh"
    local curr=$1
    if [ -f $file ]; then
        sed -i 's/DOME_VERSION="v.*"/DOME_VERSION="'$curr'"/' $file
        dome_exec git add $file
        dome_exec git commit -m "$curr"
    fi
}

dome_upgrade_semantic_version() {
    local branch=$(git rev-parse --abbrev-ref HEAD)
    if [ "$branch" != "master" ]; then
        loge "Only support on master branch, but got $branch, ABORT!"
        exit 1
    fi

    local last=$(get_last_version)
    local head=$(git rev-parse HEAD)
    local hash=$(git rev-parse $tag)

    if [ "$hash" != "$head" ]; then
        loge "Already tagged to $last, ABORT!"
        exit 1
    fi

    local curr=(bomup_version last 3)
    logi "upgrade $"
}
