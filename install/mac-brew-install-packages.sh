#!/usr/bin/env bash
DOME_BASE=`cd $(dirname $0); cd ..; pwd`
. $DOME_BASE/common/common.sh

DOME_BREW_PACKAGES=(
    "binutils"
    "coreutils"
    "dateutils"
    "diffutils"
    "findutils"
    "gputils"
    "icoutils"
    "inetutils"
    "moreutils"
    "tmux"
    "htop"
    "gnu-sed"
    "z"
    "zsh-autosuggestions"
    "ripgrep"
    "git"
    # "git-lfs"
    "git-open"
    # "aria2"
    "autossh"
    "asciidoctor"
    "bash-completion"
    # "ccat"
    "cheat"
    "cloc"
    # "csvq"
    "editorconfig"
    # "elm"
    # "ffmpeg"
    # "fx"
    "global"
    # "gnuplot"
    "golang"
    "gpg"
    "graphviz"
    # "grip"
    "httpie"
    # "jmeter"
    "jq"
    "lrzsz"
    # "lua"
    # "luarocks"
    # "maven"
    # "mplayer"
    "ncdu"
    "nmap"
    "node"
    "p7zip"
    "pandoc"
    "pgformatter"
    "pngpaste"
    "protobuf"
    # "pv"
    "python"
    "python3"
    "r"
    "ranger"
    "readline"
    "reattach-to-user-namespace"
    "rlwrap"
    "ruby"
    "sqlparse"
    # "the_platinum_searcher"
    # "the_silver_searcher"
    "tree"
    "unar"
    "wget"
    "yarn"
    # "you-get"
    "yq"
    "pdftk-java"
)

DOME_CASK_PACKAGES=(
    "alacritty"
    "emacs"
    "dbeaver-community"
    "foxmail"
    # "macpass"
    "visual-studio-code"
    # "xquartz"
    "obs"
    "shotcut"
    "vscode"
    # "mactex"
    "wpsoffice-cn"
    # "redisinsight"
    "keycastr"
    # "pympress"
)

dome_install_brew_packages() {
    for pkg in "${DOME_BREW_PACKAGES[@]}"; do
        local version=$(brew ls --versions "$pkg")

        if [ X"$version" = X"" ]; then
            dome_exec brew install $pkg
        else
            logi "find $version"
        fi
    done
}

dome_install_cask_packages() {
    for pkg in "${DOME_CASK_PACKAGES[@]}"; do
        local version=$(brew ls --cask --versions "$pkg")

        if [ X"$version" = X"" ]; then
            dome_exec brew install --cask $pkg
        else
            logi "find $version"
        fi
    done
}

dome_install_brew_packages
dome_install_cask_packages
