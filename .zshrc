export LANG=ja_JP.UTF-8
HISTFILE=$HOME/.zsh-history
HISTSIZE=100000
SAVEHIST=100000

## 補完機能の強化
autoload -U compinit
compinit

## プロンプトの設定
autoload colors
colors

autoload -Uz vcs_info
zstyle ':vcs_info:*' formats '[%b]'
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd () {
	psvar=()
	LANG=en_US.UTF-8 vcs_info
	[[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}

case ${UID} in 0)
  PROMPT="[%{${fg[blue]}%}%n@%m%{${reset_color}%}] %{${fg[blue]}%}#%{${reset_color}%} "
  PROMPT2="%B%{${fg[blue]}%}%_#%{${reset_color}%}%b "
  SPROMPT="%B%{${fg[blue]}%}%r is correct? [n,y,a,e]:%{${reset_color}%}%b "
  RPROMPT="%{${fg[blue]}%}[%~]%{${reset_color}%}%1(v|%F{green}%1v%f|)"
  ;;
*)
  PROMPT="[%{${fg[cyan]}%}%n@%m%{${reset_color}%}] %{${fg[cyan]}%}#%{${reset_color}%} "
  PROMPT2="%B%{${fg[blue]}%}%_#%{${reset_color}%}%b "
  SPROMPT="%B%{${fg[blue]}%}%r is correct? [n,y,a,e]:%{${reset_color}%}%b "
  RPROMPT="%{${fg[yellow]}%}[%~]%{${reset_color}%}%1(v|%F{green}%1v%f|)"
  ;;
esac

## コアダンプサイズを制限
limit coredumpsize 102400

## 出力の文字列末尾に改行コードが無い場合でも表示
unsetopt promptcr

## 色を使う
setopt prompt_subst

## ビープを鳴らさない
setopt nobeep

## 内部コマンド jobs の出力をデフォルトで jobs -l にする
setopt long_list_jobs

## 補完候補一覧でファイルの種別をマーク表示
setopt list_types

## サスペンド中のプロセスと同じコマンド名を実行した場合はリジューム
setopt auto_resume

## 補完候補を一覧表示
setopt auto_list

## 補完候補を詰めて表示
setopt list_packed

## 直前と同じコマンドをヒストリに追加しない
setopt hist_ignore_dups

## cd 時に自動で push
setopt autopushd

## 同じディレクトリを pushd しない
setopt pushd_ignore_dups

## ファイル名で #, ~, ^ の 3 文字を正規表現として扱う
setopt extended_glob

## TAB で順に補完候補を切り替える
setopt auto_menu

## zsh の開始, 終了時刻をヒストリファイルに書き込む
setopt extended_history

## =command を command のパス名に展開する
setopt equals

## --prefix=/usr などの = 以降も補完
setopt magic_equal_subst

## ヒストリを呼び出してから実行する間に一旦編集
setopt hist_verify

# ファイル名の展開で辞書順ではなく数値的にソート
setopt numeric_glob_sort

## 出力時8ビットを通す
setopt print_eight_bit

## ヒストリを共有
setopt share_history

## 補完候補のカーソル選択を有効に
zstyle ':completion:*:default' menu select=1

## 補完候補の色づけ
eval $(dircolors -b ~/.dircolors)
export ZLS_COLORS=$LS_COLORS
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

## ディレクトリ名だけで cd
setopt auto_cd

## カッコの対応などを自動的に補完
setopt auto_param_keys

## ディレクトリ名の補完で末尾の / を自動的に付加し、次の補完に備える
setopt auto_param_slash

## スペルチェック
setopt correct

## エイリアス
setopt complete_aliases
alias ls="ls -F --color"
alias la="ls -F -al --color"
alias ll="ls -F -l --color"
alias psa="ps auxw"
alias tmux='tmux -2'
alias ssh='TERM=xterm ssh'
alias grep='grep --color=auto'
alias tig='tig -n 1000'

## 最後のスラッシュを自動的に削除しない
setopt noautoremoveslash

# Use vim as the editor
export EDITOR=vi
# GNU Screen sets -o vi if EDITOR=vi, so we have to force it back.
set -o emacs

# Use C-x C-e to edit the current command line
autoload -U edit-command-line
zle -N edit-command-line
bindkey '\C-x\C-e' edit-command-line

## 検索
export TEXT_BROWSER=w3m

function _space2p20
{
    echo $@ |sed -e "s/ /%20/g"
}

function _space2plus
{
    echo $@ | sed -e "s/ /+/g"
}

function google
{
    ${TEXT_BROWSER} "http://www.google.co.jp/search?q="`_space2plus $@`"&hl=ja"
}

function ydic
{
    ${TEXT_BROWSER} "http://dic.yahoo.co.jp/dsearch?enc=UTF-8&p="`_space2plus $@`"&stype=0&dtype=2"
}

function technorati
{
    ${TEXT_BROWSER} http://www.technorati.com/search/`_space2p20 $@`"?language=ja"
}

function wikipedia
{
    ${TEXT_BROWSER} http://ja.wikipedia.org/wiki/`_space2p20 $@`
}

function psg
{
    psa | head -n 1
    psa | grep $* | grep -v "ps auxw" | grep -v grep
}

function pst
{
    psa | head -n 1
    psa | sort -r -n --key=3 | grep -v "ps auxw" | grep -v grep | head -n 8
}

function psm
{
    psa | head -n 1
    psa | sort -r -n --key=4 | grep -v "ps auxw" | grep -v grep | head -n 8
}

function sv5sync
{
	sh ~/tool/rsync.sh $1 $2
}

# cdr, add-zsh-hook, zmv を有効にする
autoload -Uz chpwd_recent_dirs cdr add-zsh-hook zmv
add-zsh-hook chpwd chpwd_recent_dirs
 
# cdr の設定
zstyle ':completion:*' recent-dirs-insert both
zstyle ':chpwd:*' recent-dirs-max 500
zstyle ':chpwd:*' recent-dirs-default true
zstyle ':chpwd:*' recent-dirs-file "$HOME/.cache/shell/chpwd-recent-dirs"
zstyle ':chpwd:*' recent-dirs-pushd true

# z
_Z_CMD=j
source ~/git/github/z/z.sh
# precmd() {
  # _z --add "$(pwd -P)"
# }
compctl -U -K _z_zsh_tab_completion "$_Z_CMD"

# nodebrew
if [[ -f ~/.nodebrew/nodebrew ]]; then
	export PATH=$HOME/.nodebrew/current/bin:$PATH
	nodebrew use v9.11.1
fi

# dircolors
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi

#flex sdk
path=(/opt/flex/bin(N-/) $path)

fpath=(~/.zsh/completion $fpath)

if [ -d ~/.rbenv ]; then
	export PATH=$HOME/.rbenv/bin:$PATH
	eval "$(rbenv init - zsh)"
fi

export GOPATH=$HOME/bin/go
export PATH=$PATH:$HOME/bin:$GOPATH/bin

# setting for peco
for f (~/.zsh/peco-sources/*) source "${f}" # load peco sources
bindkey '^r' peco-select-history
bindkey '^@' peco-cdr

path=(~/.composer/vendor/bin(N-/) $path)

#=============================
# source zsh-syntax-highlighting
#=============================
if [ -f ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
  source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

#=============================
# google cloud sdk
#=============================
if [[ -f ~/src/google-cloud-sdk ]]; then
	source /home/umi/src/google-cloud-sdk/completion.zsh.inc
	source /home/umi/src/google-cloud-sdk/path.zsh.inc
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
