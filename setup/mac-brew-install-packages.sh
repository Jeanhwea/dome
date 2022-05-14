DOME_BASE=`cd $(dirname $0); cd ..; pwd`
. $DOME_BASE/common/common.sh


dome_brew_install() {
    local pkgs=$*
    dome_exec brew install $pkgs
}

dome_brew_install vlc 
