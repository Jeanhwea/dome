DOME_BASE=`cd $(dirname $0); cd ..; pwd`

VERSION="29.1"
DOWNDIR="$HOME/down"
BUILDDIR="$HOME/build"

dome_download_emacs_source() {
    cd ${DOWNDIR}
    wget -c http://mirrors.ustc.edu.cn/gnu/emacs/emacs-${VERSION}.tar.gz
}

dome_build_emacs_package() {
    [ -d ${BUILDDIR} ] || mkdir ${BUILDDIR}
    cd ${BUILDDIR}

    echo "extract package: ${DOWNDIR}/emacs-${VERSION}.tar.gz"
    rm -rf ${BUILDDIR}/emacs-${VERSION}
    tar xzf ${DOWNDIR}/emacs-${VERSION}.tar.gz
    cd ${BUILDDIR}/emacs-${VERSION}

    echo "building..."
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
