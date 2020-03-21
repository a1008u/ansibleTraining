# -----------------------------
# Lang
# -----------------------------
export LANG=ja_JP.UTF-8
export LESSCHARSET=utf-8


# -----------------------------
# General
# -----------------------------
# 色を使用
autoload -Uz colors
colors
PROMPT="[%{$fg_bold[blue]%}%n%{$fg_bold[black]%}@%{$fg_bold[green]%}%m >>> %d ]%{$reset_color%} ::: "

# エディタをvimに設定
export EDITOR=vi

# -----------------------------
# 補完機能
# -----------------------------
# カッコの対応などを自動的に補完する
setopt auto_param_keys

#補完機能を有効にする
autoload -Uz compinit
compinit

#補完のリストの、選択している部分を塗りつぶす
zstyle ':completion:*' menu select

# コマンドライン全てのスペルチェックをする
setopt correct_all

export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/sbin:$PATH
export PATH="$HOME/.nodebrew/current/bin:$PATH"
export PATH="$HOME/.yarn/bin:$PATH"

export HOMEBREW_CASK_OPTS="--appdir=/Applications"
export LANG=ja_JP.UTF-8

# 色を使用
autoload -Uz colors
colors

# git のカラー表示
git config --global color.ui auto 


# 日本語ファイル名を表示可能にする
setopt print_eight_bit

# cd なしでもディレクトリ移動
setopt auto_cd

# [TAB] でパス名の補完候補を表示したあと、
# 続けて [TAB] を押すと候補からパス名を選択できるようになる
# 候補を選ぶには [TAB] か Ctrl-N,B,F,P
zstyle ':completion:*:default' menu select=1


# -----------------------------------------------
# 設定
# -----------------------------------------------
# Emacs ライクな操作を有効にする（文字入力中に Ctrl-F,B でカーソル移動など）
# Vi ライクな操作が好みであれば `bindkey -v` とする
bindkey -e

# 自動補完を有効にする
autoload -U compinit; compinit
#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/root/.sdkman"
[[ -s "/root/.sdkman/bin/sdkman-init.sh" ]] && source "/root/.sdkman/bin/sdkman-init.sh"
