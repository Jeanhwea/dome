DOME_BASE=`cd $(dirname $0); cd ..; pwd`
. $DOME_BASE/common/common.sh


# git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
# zsh-autosuggestions.zsh
DOME_ZA=/usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
if [ -f $DOME_ZA ]; then
    source $DOME_ZA
fi

export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=yellow'

# z
DOME_Z=/usr/local/etc/profile.d/z.sh
if [ -f $DOME_Z ]; then
    source $DOME_Z
fi

# find gsed in macOS
GSED_PATH="/usr/local/opt/gnu-sed/libexec/gnubin"
if [ -d $GSED_PATH ]; then
    export PATH="${GSED_PATH}:$PATH"
fi


# homebrew https://mirrors.tuna.tsinghua.edu.cn/help/homebrew/
# export HOMEBREW_API_DOMAIN="https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles/api"
# export HOMEBREW_BOTTLE_DOMAIN="https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles"
# export HOMEBREW_BREW_GIT_REMOTE="https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/brew.git"
# export HOMEBREW_CORE_GIT_REMOTE="https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-core.git"
# export HOMEBREW_PIP_INDEX_URL="https://pypi.tuna.tsinghua.edu.cn/simple"

# taobao mirror for npm
# export CHROMEDRIVER_CDNURL=http://npm.taobao.org/mirrors/chromedriver
# export ELECTRON_MIRROR=http://npm.taobao.org/mirrors/electron/
# export NVM_NODEJS_ORG_MIRROR=http://npm.taobao.org/mirrors/node
# export PHANTOMJS_CDNURL=http://npm.taobao.org/mirrors/phantomjs
# export SASS_BINARY_SITE=http://npm.taobao.org/mirrors/node-sass
# export SELENIUM_CDNURL=http://npm.taobao.org/mirrorss/selenium
# export SQLITE3_BINARY_SITE=http://npm.taobao.org/mirrors/sqlite3

DOME_HOME_BIN=$HOME/bin
if [ -d $DOME_HOME_BIN ]; then
    export PATH=$DOME_HOME_BIN:$PATH
fi

DOME_BREW_MOREUTILS_BIN=/usr/local/opt/coreutils/libexec/gnubin
if [ -d $DOME_BREW_MOREUTILS_BIN ]; then
    export PATH=$DOME_BREW_MOREUTILS_BIN:$PATH
fi

export PATH="$PATH:/usr/libexec/git-core"
