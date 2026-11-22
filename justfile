packages := "zsh helix zed ghostty karabiner"

# list recipes
default:
    @just --list

# link all packages, or only the ones named
link *pkgs=packages: _check
    stow -v -t ~ {{ pkgs }}

# remove links for all packages, or only the ones named
unlink *pkgs=packages: _check
    stow -v -t ~ -D {{ pkgs }}

# show what linking would do, without changing anything
plan *pkgs=packages: _check
    stow -n -v -t ~ {{ pkgs }}

# move live files into the repo and link them; review with git diff
adopt *pkgs=packages: _check
    stow -v -t ~ --adopt {{ pkgs }}
    git diff --stat

_check:
    @command -v stow >/dev/null || { echo "stow is not installed: brew install stow"; exit 1; }
