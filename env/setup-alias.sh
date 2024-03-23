# DOME_BASE=`cd $(dirname $0); cd ..; pwd`
# . $DOME_BASE/common/common.sh

# Version Control
alias pl='dm git-pull-curr-dir'
alias cl='dm git-clone-remote-repository'
alias ra='dm git-add-remote-url'
alias clu='dm git-clone-repository-to-local'
alias clg='dm git-clone-remote-repository github'
alias clx='dm git-clone-remote-repository mtiisl'
alias clp='dm git-github-proxy-clone'
alias gh='dm git-add-remote-url github'
alias gn='dm git-add-remote-url gitana'

# docker
dc='docker-compose'

# Helper
alias dt='dm date'
alias pdf='dm doc-conv-to-pdf'

# Git
alias cg='cd $(git rev-parse --show-toplevel)'

# FrontEnd
alias ys='[ -d node_modules ] && yarn start || yarn'

# Emacs
alias e='emacs -nw'
alias em='emacsclient -n'

# Makefile
alias fmt='make format'
alias gen='make generate'
alias pub='make publish'
alias lin='make lint'
alias brw='make browse'
alias doc='make doc'

# alias for make
alias m='make'
alias mc='make clean'
alias md='make distclean'
alias mt='make test'
alias mr='make run'
alias mn='make -j$(nproc)'

# alias for cargo
alias cr='RUST_LOG=info RUST_BACKTRACE=1 cargo run --quiet'
alias ct='RUST_LOG=info RUST_BACKTRACE=1 cargo test --quiet -- --show-output'
alias cb='cargo build'

# aliax for emulator
alias qm='make qemu'
alias qx='make qemu-nox-gdb'
alias bo='make bochs'

# Tmux
alias ta='dm tmux-create-or-attach-server'
alias td='tmux detach'
# alias box="ssh username@host -t 'tmux attach'"

# ls
alias ls='ls -v --color'
alias ll='ls -lh -v --color'
