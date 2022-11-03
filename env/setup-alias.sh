DOME_BASE=`cd $(dirname $0); cd ..; pwd`
. $DOME_BASE/common/common.sh

# Misc
alias cbc='dome cl'
alias dt='dm date'

# Emacs
alias e='emacs -nw'
alias em='emacsclient --no-wait'

# Makefile
alias fmt='make format'
alias gen='make generate'
alias m='make'

# Tmux
alias ta='dm tmux-create-or-attach-server'
