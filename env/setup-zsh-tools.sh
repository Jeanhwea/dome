DOME_BASE=`cd $(dirname $0); cd ..; pwd`
. $DOME_BASE/common/common.sh


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


# change homebrew bottle domain
# export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles

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
