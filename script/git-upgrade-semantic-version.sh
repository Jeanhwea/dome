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
    local projroot=$(git rev-parse --show-toplevel)
    local verfile="$projroot/common/symbol-meta.sh"
    local currver=$1
    if [ -f $verfile ]; then
        sed -i 's/DOME_VERSION="v.*"/DOME_VERSION="'$currver'"/' $verfile
        git add $verfile
        git commit -m "$currver"
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
