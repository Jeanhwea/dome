export RUSTUP_DIST_SERVER=https://rsproxy.cn
export RUSTUP_UPDATE_ROOT=https://rsproxy.cn/rustup

if [ -f "$HOME/.cargo/env" ]; then
   source "$HOME/.cargo/env"
fi
