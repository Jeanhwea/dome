DOME_BASE=`cd $(dirname $0); cd ..; pwd`
. $DOME_BASE/common/common.sh

# Misc
alias cl='dm git-clone-remote-repository'
alias clu='dm git-clone-repository-to-local'
alias clg='dm git-clone-remote-repository github'
alias dt='dm date'

# Git
alias cg='cd $(git rev-parse --show-toplevel)'

# Emacs
alias e='emacs -nw'
alias em='emacsclient --no-wait'

# Makefile
alias fmt='make format'
alias gen='make generate'
alias push='make push'
alias m='make'
alias t='make test'

# Tmux
alias ta='dm tmux-create-or-attach-server'
alias td='tmux detach'
# alias box="ssh username@host -t 'tmux attach'"
