# DOME_BASE=`cd $(dirname $0); cd ..; pwd`
# . $DOME_BASE/common/common.sh

# Version Control
alias pl='dm git-pull-curr-dir'
alias cl='dm git-clone-remote-repository'
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
alias cln='make clean'

alias m='make'
alias t='make test'
alias r='make run'

# Tmux
alias ta='dm tmux-create-or-attach-server'
alias td='tmux detach'
# alias box="ssh username@host -t 'tmux attach'"

# ls
alias ls='ls -v --color=tty'
alias ll='ls -lh -v --color=tty'
