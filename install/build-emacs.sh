DOME_BASE=`cd $(dirname $0); cd ..; pwd`

VERSION="29.1"
DOWNDIR="~/down"
BUILDDIR="~/build"

dome_download_emacs_source() {
    cd ${DOWNDIR}
    wget -c http://mirrors.ustc.edu.cn/gnu/emacs/emacs-${VERSION}.tar.gz
}

dome_build_emacs_package() {
    [ -d ${BUILDDIR} ] || mkdir ${BUILDDIR}
    cd ${BUILDDIR}
    tar xzvf ${DOWNDIR}/emacs-${VERSION}.tar.gz

    cd ${BUILDDIR}/emacs-${VERSION}
    ./configure
    make -j$(nproc)
}

dome_install_emacs() {
    cd ${BUILDDIR}/emacs-${VERSION}
    sudo make install
}


dome_download_emacs_source
dome_build_emacs_package
dome_install_emacs
