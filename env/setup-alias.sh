# DOME_BASE=`cd $(dirname $0); cd ..; pwd`
# . $DOME_BASE/common/common.sh

# Version Control
alias pl='dm git-pull-curr-dir'
alias pa='dm git-push-all-remotes'
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
alias lin='make lint'
alias pub='make publish'
alias pack='make package'
alias brw='make browse'
alias doc='make doc'
alias ins='make install'

# alias for make
alias m='make'
alias mc='make clean'
alias md='make distclean'
alias mt='make test'
alias t='make test'
alias tt='make t0'
alias t0='make t0'
alias t1='make t1'
alias t2='make t2'
alias mr='make run'
alias mn='make -j$(nproc)'
alias run='make run'
alias fix='make fix'
alias logf='make logf'

# alias for cargo
alias cr='cargo run --'
alias ct='cargo test -- --show-output'
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
