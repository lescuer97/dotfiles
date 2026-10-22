# OpenCode

From the dotfiles repository root, preview and install this GNU Stow package:

```sh
stow --simulate --verbose -t "$HOME" opencode
stow -t "$HOME" opencode
```

Install OpenCode and GNU Stow first. Back up any existing
`~/.config/opencode` files if Stow reports conflicts; do not use `--adopt`
unless you intend to replace the repository's settings with those files.

The package includes OpenCode configuration, CLI preferences, memory plugin
settings, and custom agents. Dependencies and machine-local service state are
excluded from Git and Stow; OpenCode manages these on each machine. Authenticate
providers separately. Memory data and credentials are not included.

The `ppq` provider (also used by the security agent) requires a local proxy at
`http://127.0.0.1:8787/v1`. Run that proxy or adjust the provider on the new
machine. The nono sandbox plugin and skill are installed by nono and are not
portable symlinks; install the nono integration separately if needed.

Keep `~/.config` as a real directory, with separate app links:

```text
~/.config/nvim     -> dotfiles/nvim/.config/nvim
~/.config/opencode -> dotfiles/opencode/.config/opencode
```

Create `~/.config` before the first Stow invocation on a new machine so it
does not become a symlink owned by a single package:

```sh
mkdir -p "$HOME/.config"
stow -t "$HOME" nvim opencode
```
