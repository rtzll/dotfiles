export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="takashiyoshida"

# include zsh completions
fpath=(~/.zsh/completion $fpath)

source <(antibody init)

export PATH=$PATH:$HOME/bin          # leiningen et al.
export PATH=$PATH:$HOME/.local/bin   # python packages
export PATH=$PATH:$HOME/.yarn/bin    # yarn packages

export DENO_INSTALL=$HOME/.deno
export PATH=$DENO_INSTALL/bin:$PATH

# setup environment for go
export PATH=$PATH:/usr/local/go/bin
export GOPATH=$(go env GOPATH)
export PATH=$PATH:$GOPATH/bin

source $ZSH/oh-my-zsh.sh
export LANG=en_US.UTF-8
export EDITOR=vim

# shortcuts
alias zshconfig="$EDITOR $HOME/.zshrc"
alias vimconfig="$EDITOR $HOME/.vimrc"

alias install="sudo apt install"
alias remove="sudo apt remove"
alias update="sudo apt update"
alias upgrade="sudo apt update && sudo apt upgrade"
alias dupgrade="sudo apt dist-upgrade && sudo apt autoremove"

alias venv="python3 -m venv venv && . venv/bin/activate && pip install --upgrade pip setuptools > /dev/null"

# Base16 Shell, see https://github.com/chriskempson/base16-shell
BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && \
	[ -s $BASE16_SHELL/profile_helper.sh ] && \
		eval "$($BASE16_SHELL/profile_helper.sh)"
# normally I use: base16_monokai (type "base16_" and tab for alternatives)

# fuzzy finder: https://github.com/junegunn/fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
