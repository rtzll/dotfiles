# Essential environment for every zsh, including scripts and non-login shells.
# Keep this free of subprocesses and login/interactive tool initialization.

typeset -gU path

# Default locale without overriding an explicitly selected locale.
export LANG="${LANG:-en_US.UTF-8}"

# Tool installation directories.
export PNPM_HOME="$HOME/Library/pnpm"
export BUN_INSTALL="$HOME/.bun"
export PROTO_HOME="$HOME/.proto"
export VP_HOME="$HOME/.vite-plus"

# Temurin 21 (brew cask temurin@21) is the only JDK; /usr/bin/java finds it.
if [[ -d /Library/Java/JavaVirtualMachines/temurin-21.jdk/Contents/Home ]]; then
  export JAVA_HOME=/Library/Java/JavaVirtualMachines/temurin-21.jdk/Contents/Home
fi

# Static PATH entries live here; runtime managers activate in .zshrc.
path=(
  $HOME/.pi/agent/bin(N)
  $PROTO_HOME/shims(N)
  $PROTO_HOME/bin(N)
  $VP_HOME/bin(N)
  $HOME/bin(N)
  $HOME/.local/bin(N)
  $HOME/.grok/bin(N)
  $HOME/.opencode/bin(N)
  $HOME/go/bin(N)
  $PNPM_HOME/bin(N)
  $PNPM_HOME(N)
  $BUN_INSTALL/bin(N)
  $HOME/.orbstack/bin(N)
  "$HOME/Library/Application Support/Coursier/bin"(N)
  /opt/homebrew/opt/sqlite/bin(N)
  /opt/{homebrew,local}/{,s}bin(N)
  /usr/local/{,s}bin(N)
  $path
  $VP_HOME/fallback-bin(N)
)
export PATH

# Rust toolchain — needed in scripts and non-interactive shells.
[[ -r "$HOME/.cargo/env" ]] && source "$HOME/.cargo/env"
