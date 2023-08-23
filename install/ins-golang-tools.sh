DOME_BASE=`cd $(dirname $0); cd ..; pwd`
. $DOME_BASE/common/common.sh

DOME_GOLANG_PACKAGES=(
    "github.com/cloudwego/hertz/cmd/hz"
    "github.com/cloudwego/thriftgo"
    "github.com/fatih/gomodifytags"
    "github.com/go-delve/delve/cmd/dlv"
    "github.com/mdempsky/gocode"
    "github.com/minodisk/thriftfmt"
    "github.com/rogpeppe/godef"
    "github.com/swaggo/swag/cmd/swag"
    "golang.org/x/tools/cmd/godoc"
    "golang.org/x/tools/cmd/goimports"
    "golang.org/x/tools/gopls"
    "gorm.io/gen/tools/gentool"
    "github.com/antonmedv/fx"
)

dome_install_golang_package() {
    local pkg=$*
    for pkg in "${DOME_GOLANG_PACKAGES[@]}"; do
        dome_exec go install $pkg@latest
    done
}

dome_install_golang_package
