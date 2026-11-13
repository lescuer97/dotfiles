# Install dotfiles

From the repository root, create the config directory and preview the links:

```sh
mkdir -p "$HOME/.config"
stow --simulate --verbose -t "$HOME" alacritty ghostty nono nvim opencode terminal tmux
```

Creating `~/.config` first prevents Stow from folding it into a single symlink. Back up or move any existing conflicting files instead of overwriting them, then install:

```sh
stow -t "$HOME" alacritty ghostty nono nvim opencode terminal tmux
```
