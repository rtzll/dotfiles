# Login-session setup, loaded before .zshrc.
# Essential paths for scripts and non-login shells live in .zshenv.


# ── Environment ───────────────────────────────────────────────────────────────

# Default browser on macOS.
export BROWSER='open'

# Use Helix when available, otherwise Vim, for shell utilities and Git.
if command -v hx >/dev/null 2>&1; then
  export EDITOR='hx'
  export VISUAL='hx'
  export GIT_EDITOR='hx'
else
  export EDITOR='vim'
  export VISUAL='vim'
  export GIT_EDITOR='vim'
fi

# Default pager; locale is configured in .zshenv.
export PAGER='less'
export LESS='-F -g -i -M -R -S -w -X -z-4'


# ── Homebrew ──────────────────────────────────────────────────────────────────

# Ensure PATH has no duplicates.
typeset -gU cdpath fpath mailpath path

# Essential binary paths are already set in .zshenv.
# Load Homebrew's additional login-session environment when available.
if (( $+commands[brew] )); then
  eval "$(brew shellenv)"
fi

# ── Haskell ───────────────────────────────────────────────────────────────────
#
# ghcup manages the Haskell toolchain: GHC compiler, cabal, stack, HLS.
[[ -r "$HOME/.ghcup/env" ]] && source "$HOME/.ghcup/env"


# ── OCaml ─────────────────────────────────────────────────────────────────────
#
# opam is the OCaml package manager. Its init script sets PATH and environment
# variables for the active switch (compiler version + installed packages).
if [[ -r "$HOME/.opam/opam-init/init.zsh" ]]; then
  source "$HOME/.opam/opam-init/init.zsh" > /dev/null 2>&1
fi


# ── Tools ─────────────────────────────────────────────────────────────────────

# OrbStack — command-line tools and shell integration.
[[ -r "$HOME/.orbstack/shell/init.zsh" ]] && source "$HOME/.orbstack/shell/init.zsh"
