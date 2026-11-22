# ── Completion paths ──────────────────────────────────────────────────────────

# Prezto initializes completion; register custom functions before it loads.
fpath=(~/.zsh/functions(N) ~/.zsh(N) ~/.grok/completions/zsh(N) $fpath)
autoload -Uz rename_clean


# ── Shell framework ───────────────────────────────────────────────────────────
#
# Prezto is the zsh configuration framework providing prompt, completions,
# syntax highlighting, and other shell enhancements.
if [[ -r "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi


# ── Shell environment ─────────────────────────────────────────────────────────

# Disable zsh's command autocorrection — the "zsh: correct 'foo' to 'bar'?" prompt.
# More disruptive than helpful, especially with custom scripts and unfamiliar tools.
unsetopt CORRECT

# Keep a larger history with deduplication and sharing across sessions.
#
# SHARE_HISTORY syncs history in real time across all open terminal windows.
# HIST_IGNORE_SPACE means commands prefixed with a space are not saved —
# useful for sensitive commands you don't want in history.
HISTFILE=~/.zsh_history
HISTSIZE=50000
SAVEHIST=50000
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS
setopt SHARE_HISTORY
setopt HIST_IGNORE_SPACE


# ── JavaScript / TypeScript ───────────────────────────────────────────────────

# bun shell completions — interactive shells only.
[[ -r "$HOME/.bun/_bun" ]] && source "$HOME/.bun/_bun"


# ── Tools ─────────────────────────────────────────────────────────────────────

# fzf — fuzzy finder
# ~/.fzf.zsh sets up PATH, tab completions, and key bindings.
# Active key bindings: Ctrl+R (history), Ctrl+T (file picker), Alt+C (cd jump).
[[ -r "$HOME/.fzf.zsh" ]] && source "$HOME/.fzf.zsh"

# zoxide — smarter cd
# Tracks visited directories so you can jump with `z <partial-name>`
# instead of typing full paths.
if (( $+commands[zoxide] )); then
  eval "$(zoxide init zsh)"
fi

# jj — Jujutsu VCS shell completions
if (( $+commands[jj] )); then
  source <(COMPLETE=zsh jj)
fi

# Vite+ shell integration and completions (https://viteplus.dev).
[[ -r "$VP_HOME/env" ]] && source "$VP_HOME/env"

# mise — retain the existing runtime-manager activation.
if (( $+commands[mise] )); then
  eval "$(mise activate zsh)"
fi

# Preserve managed Pi and proto shim priority after other tool activation.
# Static installation paths are configured in .zshenv.
typeset -gU path
path=($HOME/.pi/agent/bin(N) $PROTO_HOME/shims(N) $PROTO_HOME/bin(N) $path)


# ── Functions ─────────────────────────────────────────────────────────────────

# h — start a local Hugo dev server
# Flags: -F future posts, -O open browser, -N no caching, -D include drafts
function h() {
  hugo server -F -O -N -D --bind 0.0.0.0
}

# y — yazi file manager wrapper
# Changes the shell's working directory to wherever you navigated inside yazi.
# Without this wrapper the directory change would be lost when yazi exits.
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}


# ── Aliases ───────────────────────────────────────────────────────────────────

alias lg='lazygit'
alias c='codex resume'

# rm — moves files to Trash instead of permanently deleting them.
# Provides the same safety net as dragging to Trash in Finder.
# Use `command rm` to bypass this and permanently delete when you're certain.
#
# macOS trash rejects rm's flags, so they are dropped: folders always go to
# the Trash, and -f only silences missing paths, like rm -f.
(( $+aliases[rm] )) && unalias rm
rm() {
  local arg force=0 options_done=0 missing=0
  local -a targets

  for arg in "$@"; do
    if (( ! options_done )) && [[ $arg == -- ]]; then
      options_done=1
    elif (( ! options_done )) && [[ $arg =~ '^-[rRfidvI]+$' ]]; then
      [[ $arg == *f* ]] && force=1
    elif [[ -e $arg || -L $arg ]]; then
      # trash has no `--`, so protect names that start with a dash.
      [[ $arg == -* ]] && arg="./$arg"
      targets+=("$arg")
    elif (( ! force )); then
      print -u2 "rm: $arg: No such file or directory"
      missing=1
    fi
  done

  if (( $#targets )); then
    trash "${targets[@]}" || return
  elif (( ! force && ! missing )); then
    print -u2 "usage: rm [-rf] file ..."
    return 64
  fi
  return $missing
}

# Prezto aliases lk to a file listing variant, which conflicts with the LiveKit
# CLI tool. Unaliasing here frees it up for lk (LiveKit).
(( $+aliases[lk] )) && unalias lk
