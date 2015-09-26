#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

for config_file ($HOME/.yadr/zsh/*.zsh) source $config_file

# Customize to your needs...
# User configuration

export PATH="/home/kanbe/.rvm/gems/ruby-2.1.3/bin:/home/kanbe/.rvm/gems/ruby-2.1.3@global/bin:/home/kanbe/.rvm/rubies/ruby-2.1.3/bin:/home/kanbe/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/home/kanbe/.rvm/bin:/home/kanbe/.rvm/bin"
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"


bindkey -v

# 自動補完を有効にする
# コマンドの引数やパス名を途中まで入力して <Tab> を押すといい感じに補完してくれる
# 例： `cd path/to/<Tab>`, `ls -<Tab>`
autoload -U compinit; compinit

# 入力したコマンドが存在せず、かつディレクトリ名と一致するなら、ディレクトリに cd する
# 例： /usr/bin と入力すると /usr/bin ディレクトリに移動
setopt auto_cd

# ↑を設定すると、 .. とだけ入力したら1つ上のディレクトリに移動できるので……
# 2つ上、3つ上にも移動できるようにする
alias ...='cd ../..'
alias ....='cd ../../..'

# "~hoge" が特定のパス名に展開されるようにする（ブックマークのようなもの）
# 例： cd ~hoge と入力すると /long/path/to/hogehoge ディレクトリに移動
hash -d hoge=/long/path/to/hogehoge

# cd した先のディレクトリをディレクトリスタックに追加する
# ディレクトリスタックとは今までに行ったディレクトリの履歴のこと
# `cd +<Tab>` でディレクトリの履歴が表示され、そこに移動できる
setopt auto_pushd

# pushd したとき、ディレクトリがすでにスタックに含まれていればスタックに追加しない
setopt pushd_ignore_dups

# 拡張 glob を有効にする
# glob とはパス名にマッチするワイルドカードパターンのこと
# （たとえば `mv hoge.* ~/dir` における "*"）
# 拡張 glob を有効にすると # ~ ^ もパターンとして扱われる
# どういう意味を持つかは `man zshexpn` の FILENAME GENERATION を参照
setopt extended_glob

# 入力したコマンドがすでにコマンド履歴に含まれる場合、履歴から古いほうのコマンドを削除する
# コマンド履歴とは今まで入力したコマンドの一覧のことで、上下キーでたどれる
setopt hist_ignore_all_dups

# コマンドがスペースで始まる場合、コマンド履歴に追加しない
# 例： <Space>echo hello と入力
setopt hist_ignore_space

# http://d.hatena.ne.jp/mowamowa/20070509/1178688765
setopt inc_append_history hist_ignore_dups

# <Tab> でパス名の補完候補を表示したあと、
# 続けて <Tab> を押すと候補からパス名を選択できるようになる
# 候補を選ぶには <Tab> か Ctrl-N,B,F,P
zstyle ':completion:*:default' menu select=1

# 単語の一部として扱われる文字のセットを指定する
# ここではデフォルトのセットから / を抜いたものとする
# こうすると、 Ctrl-W でカーソル前の1単語を削除したとき、 / までで削除が止まる
WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'

EDITOR=vim
VISUAL=vim

autoload edit-command-line
zle -N edit-command-line
# bindkey -M vicmd "^v" edit-command-line
bindkey '^v' edit-command-line

HISTFILE=$HOME/.zsh-history
HISTSIZE=100000
SAVEHIST=100000

## グローバルエイリアスの設定
# cat hoge | less をcat hoge L という風に記述できる。
alias -g L='| less'
alias -g H='| head'
alias -g T='| tail'
alias -g G='| grep'
alias -g W='| wc'
alias -g S='| sed'
alias -g A='| awk'
#alias -g P='| peco'
alias -g N='| growlnotify -s -t "command" -m "finished."'

alias emacs='vim'

# http://qiita.com/uchiko/items/f6b1528d7362c9310da0
function peco-select-history() {
    local tac
    if which tac > /dev/null; then
        tac="tac"
    else
        tac="tail -r"
    fi
    BUFFER=$(\history -n 1 | \
        eval $tac | \
        peco --query "$LBUFFER")
    CURSOR=$#BUFFER
    zle clear-screen
}
zle -N peco-select-history
bindkey '^r' peco-select-history



# C-jで下のディレクトリに移動する
function cddown_dir(){
com='$SHELL -c "ls -AF . | grep / "'
while [ $? = 0 ]
do
    cdir=`eval $com | peco`
    if [ $? = 0 ];then
        cd $cdir
        eval $com
    else
        break
    fi
done
zle reset-prompt
}
zle -N cddown_dir
bindkey '^j' cddown_dir


# Fuzzy Find and cd
function peco-fuzzy-find-cd() {
  local FILENAME="$1"

  if [ -z "$FILENAME" ] ; then
    FILENAME="*"
  else
    FILENAME="*${FILENAME}*"
  fi

  #local DIR=$(find ~ -maxdepth 5 -iname "${FILENAME}" -type d | peco | head -n 1)
  local DIR=$(find ~ -iname "${FILENAME}" -type d | peco | head -n 1)

  if [ -n "$DIR" ] ; then
    DIR=${DIR%/*}
    #echo "pushd \"$DIR\""
    pushd "$DIR"
  fi
}
alias ff='peco-fuzzy-find-cd'
zle -N peco-fuzzy-find-cd
bindkey '^f' peco-fuzzy-find-cd


# http://qiita.com/fmy/items/b92254d14049996f6ec3
function vim-ag () {
  vim $(ag $@ | peco --query "$LBUFFER" | awk -F : '{print "-c " $2 " " $1}')
}
alias vg='vim-ag'

# find | peco | vim
function vim-find () {
  #vim $(find ~ -maxdepth 10 | peco --query "$LBUFFER")
  #vim $(find . | peco --query "$LBUFFER")
  #vim $(find . | grep "$LBUFFER" | peco )
  vim $(find . -name "*$@*" | peco )
}
alias vf='vim-find'

# find -atime | peco | vim
function vim-find-recent-accessed() {
  vim $(find . -not -path "*/.*" -atime -3 | peco --query "$LBUFFER")
}

# find -mtime | peco | vim
function vim-find-recent-modified() {
  vim $(find . -not -path "*/.*" -mtime -3 | peco --query "$LBUFFER")
}

# export
export PATH=$HOME/bin:$PATH
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

#export GOROOT=/usr/local/go
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOROOT/bin
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

alias tmux='tmux -2'

# docker
function docker-images-id() {
  docker images | tail -n +2 | peco | awk -F" " '{print $3}'
}

function docker-ps-name() {
  docker ps | tail -n +2 | peco | awk -F" " '{print $1}'
}

function docker-ps-a-name() {
  docker ps -a | tail -n +2 | peco | awk -F" " '{print $1}'
}

function docker-notag() {
  docker images | grep '<none>' | awk '{print$3}'
}

alias dps='docker ps'

#alias drun='docker run -d $(docker-images-id)'
alias drun='docker run -i -t -d $(docker-images-id) /bin/bash'
alias drunsshd='docker run -i -t -p 2222:22 -d $(docker-images-id) /usr/sbin/sshd -D'

alias dstop='docker stop $(docker-ps-name)'
alias dstart='docker start $(docker-ps-a-name)'
alias drm='docker rm $(docker-ps-a-name)'
alias drmall='docker rm $(docker ps -a -q)'
alias drmi='docker rmi $(docker-images-id)'
alias drminotag='docker rmi $(docker-notag)'

alias dattach='docker attach $(docker-ps-name)'
alias dexec='docker exec -it $(docker-ps-name) /bin/bash'

alias dinspect='docker inspect $(docker-ps-name)'
alias dport='docker port $(docker-ps-name)'
alias dlogs='docker logs -f $(docker-ps-name)'
alias dtop='docker top $(docker-ps-name)'

 #  alias dinspect='docker inspect $(docker-images-id)'

alias g='cd $(ghq list -p | peco)'
alias gh='gh-open $(ghq list -p | peco)'

# the fuck
alias fuck='eval $(thefuck $(fc -ln -1))'
alias FUCK='fuck'

# nodebrew
export PATH=$HOME/.nodebrew/current/bin:$PATH

# boot2docker
export DOCKER_HOST=tcp://192.168.59.103:2376
export DOCKER_CERT_PATH=/Users/kotakanbe/.boot2docker/certs/boot2docker-vm
export DOCKER_TLS_VERIFY=1


# Added by termtile (https://github.com/apaszke/termtile)
alias tul='osascript ~/.termtile/tile.scpt up left'
alias tur='osascript ~/.termtile/tile.scpt up right'
alias tdl='osascript ~/.termtile/tile.scpt down left'
alias tdr='osascript ~/.termtile/tile.scpt down right'
alias tll='osascript ~/.termtile/tile.scpt left'
alias trr='osascript ~/.termtile/tile.scpt right'
alias tup='osascript ~/.termtile/tile.scpt up'
alias tdown='osascript ~/.termtile/tile.scpt down'
alias tbig='osascript ~/.termtile/resize.scpt '
alias tcen='osascript ~/.termtile/center.scpt '
alias tmax='osascript ~/.termtile/maximize.scpt '
alias tsn='osascript ~/.termtile/changeScreen.scpt next'
alias tfs='osascript ~/.termtile/fullscreen.scpt '

# cdr http://wada811.blogspot.com/2014/09/zsh-cdr.html
# cdr, add-zsh-hook を有効にする
autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
add-zsh-hook chpwd chpwd_recent_dirs

# cdr の設定
zstyle ':completion:*' recent-dirs-insert both
zstyle ':chpwd:*' recent-dirs-max 500
zstyle ':chpwd:*' recent-dirs-default true
zstyle ':chpwd:*' recent-dirs-file "$HOME/.cache/shell/chpwd-recent-dirs"
zstyle ':chpwd:*' recent-dirs-pushd true

function peco-cdr () {
	local selected_dir=$(cdr -l | awk '{ print $2 }' | peco)
	if [ -n "$selected_dir" ]; then
		BUFFER="cd ${selected_dir}"
		zle accept-linel
	fi
	zle clear-screen
} 
zle -N peco-cdr
bindkey '^e' peco-cdr
