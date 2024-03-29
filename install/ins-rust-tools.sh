#!/usr/bin/env bash
DOME_BASE=`cd $(dirname $0); cd ..; pwd`
. $DOME_BASE/common/common.sh

DOME_RUST_PACKAGES=(
    "rust-analyzer"
    "rust-src"
)

dome_install_rust_package() {
    local pkg=$*
    for pkg in "${DOME_RUST_PACKAGES[@]}"; do
        dome_exec rustup component add $pkg
    done
}

dome_install_rust_package
