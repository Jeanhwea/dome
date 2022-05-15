DOME_BASE=`cd $(dirname $(readlink -f $0)); cd ..; pwd`
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
    "aria2"
    "asciidoctor"
    "bash-completion"
    "ccat"
    "cheat"
    "cloc"
    "editorconfig"
    "elm"
    "ffmpeg"
    "fx"
    "git"
    "git-lfs"
    "git-open"
    "global"
    "gnu-sed"
    "golang"
    "graphviz"
    "grip"
    "htop"
    "httpie"
    "jq"
    "lrzsz"
    "lua"
    "luarocks"
    "maven"
    "mplayer"
    "ncdu"
    "nmap"
    "node"
    "p7zip"
    "pandoc"
    "pgformatter"
    "protobuf"
    "pv"
    "python"
    "python3"
    "r"
    "ranger"
    "readline"
    "reattach-to-user-namespace"
    "rg"
    "rlwrap"
    "ruby"
    "sqlparse"
    "the_platinum_searcher"
    "the_silver_searcher"
    "tmux"
    "tree"
    "unar"
    "wget"
    "yarn"
    "you-get"
    "z"
    "zsh-autosuggestions"
)

dome_brew_install() {
    local pkg=$*
    local version=$(brew ls --versions "$pkg")

    if [ X"$version" = X"" ]; then
        dome_exec brew install $pkg
    else
        logi "find $version"
    fi
}

dome_install_brew_packages() {
    for pkg in "${DOME_BREW_PACKAGES[@]}"; do
        dome_brew_install $pkg
    done
}

dome_install_brew_packages