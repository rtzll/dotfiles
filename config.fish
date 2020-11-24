export EDITOR='vim'
export VISUAL='vim'
export PAGER='less'
export LESS='-F -g -i -M -R -S -w -X -z-4'
export LANG='en_US.UTF-8'

set -gx PATH /usr/local/{bin,sbin} $HOME/.cargo/bin $HOME/bin $HOME/.local/bin $HOME/.yarn/bin $HOME/.deno/bin $PATH
