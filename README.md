# My dotfiles repo

This repo is managed using a bare git repository.

Setting up from scratch:
```bash
git init --bare $HOME/.dotfiles
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
```

Cloning:
```bash
git clone --bare <repo-url> $HOME/.dotfiles
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
dotfiles checkout
```

Configuration (required for both setup methods):
```bash
dotfiles config --local status.showUntrackedFiles no
dotfiles config --local core.excludesFile "$HOME/.config/dotfiles-ignore"
```


Contains configurations for:
- tmux: Terminal multiplexer for managing multiple sessions.
- nvim: Highly customized text editor configuration with plugins and key mappings.
- ghostty: Terminal emulator settings for themes, fonts, and behavior.
- bash: Shell configuration.
- aerospace: i3-like window/tiling manager
- brewfile: homebrew installation list 

Requirements:
Look through the Brewfile.
