DOME_BASE=`cd $(dirname $(readlink -f $0)); cd ..; pwd`
. $DOME_BASE/common/common.sh

# zsh-autosuggestions.zsh
DOME_ZA=/usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
[ -f $DOME_ZA ] && source $DOME_ZA

export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=yellow'

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
