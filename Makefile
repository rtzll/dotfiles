HOME_DIR := $(HOME)
CONFIG_DIR := $(HOME_DIR)/.config
GHOSTTY_DIR := "$(HOME_DIR)/Library/Application Support/com.mitchellh.ghostty"
ZPREZTO_DIR := $(HOME_DIR)/.zprezto

.PHONY: all
all: help

.PHONY: help
help:
	@echo "Usage: make [target]"
	@echo ""
	@echo "Targets:"
	@echo "  install    - Install all configurations"
	@echo "  uninstall  - Remove all configurations"
	@echo "  helix      - Install/update helix configuration"
	@echo "  zed        - Install/update zed configuration"
	@echo "  ghostty    - Install/update ghostty configuration"
	@echo "  zsh        - Install/update zsh configuration"
	@echo "  help       - Show this help message"

.PHONY: install uninstall
install: helix zed ghostty zsh

uninstall:
	stow -v -D -t "$(CONFIG_DIR)/helix" -d .config/helix .
	stow -v -D -t "$(CONFIG_DIR)/zed" -d .config/zed .
	stow -v -D -t "$(GHOSTTY_DIR)" -d .config/ghostty .
	stow -v -D -t "$(HOME_DIR)" -d .zprezto/runcoms .

.PHONY: helix
helix:
	mkdir -p "$(CONFIG_DIR)/helix"
	stow -v -t "$(CONFIG_DIR)/helix" -d .config/helix .

.PHONY: zed
zed:
	mkdir -p "$(CONFIG_DIR)/zed"
	stow -v -t "$(CONFIG_DIR)/zed" -d .config/zed .

.PHONY: ghostty
ghostty:
	mkdir -p "$(GHOSTTY_DIR)"
	stow -v -t "$(GHOSTTY_DIR)" -d .config/ghostty .

.PHONY: zsh
zsh:
	mkdir -p "$(ZPREZTO_DIR)"
	stow -v -t "$(HOME_DIR)" -d .zprezto/runcoms .

.PHONY: check
check:
	@which stow > /dev/null || (echo "stow is not installed. Install with: brew install stow" && exit 1)
