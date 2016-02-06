export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="robbyrussell"

fpath=(~/.zsh/completion $fpath)

# antigen settings
source ~/antigen.zsh
antigen use oh-my-zsh
antigen bundle git
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-completions
antigen apply

# User configuration
export PATH=$PATH:/usr/lib/dart/bin  # dart
export PATH=$PATH:/usr/local/go/bin  # go
export PATH=$PATH:$HOME/.local/bin   # binaries installed via pip
export GOPATH=$HOME/src/go           # GOPATH
export PATH=$PATH:$GOPATH/bin        # include go binaries
export WORKON_HOME=$HOME/.virtualenvs
source $HOME/.local/bin/virtualenvwrapper.sh
source $ZSH/oh-my-zsh.sh

export LANG=en_US.UTF-8
export EDITOR=vim

alias zshconfig="$EDITOR $HOME/.zshrc"
alias vimconfig="$EDITOR $HOME/.vimrc"

alias install="sudo apt-get install"
alias remove="sudo apt-get remove"
alias update="sudo apt-get update"
alias upgrade="sudo apt-get update && sudo apt-get upgrade"
alias dupgrade="sudo apt-get dist-upgrade && sudo apt-get autoremove"
alias lsd="ls -d -- */"
alias tmux="tmux -2"

# Base16 Shell, see https://github.com/chriskempson/base16-shell
BASE16_SHELL="$HOME/.config/base16-shell/base16-default.dark.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL
