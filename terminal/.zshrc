# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source ~/powerlevel10k/powerlevel10k.zsh-theme
source "$HOME/.cargo/env"
ZSH_THEME="powerlevel10k/powerlevel10k"
export WASMTIME_HOME="$HOME/.wasmtime"

export PATH="$WASMTIME_HOME/bin:$PATH"

export DENO_INSTALL="/home/leo/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

export EDITOR=nvim

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Wasmer
export WASMER_DIR="/home/leo/.wasmer"
[ -s "$WASMER_DIR/wasmer.sh" ] && source "$WASMER_DIR/wasmer.sh"
source "$HOME/.cargo/env"
export DENO_INSTALL="/home/leo/.deno"
export PATH=$PATH:/usr/local/go/bin
export PATH=":$PATH:/home/leo/go/bin"
export PATH="$DENO_INSTALL/bin:$PATH"
export PATH=":$PATH:/home/leo/.local/bin"
export PATH=":$PATH:/home/leo/.local/bin/lnd"
export PATH=":$PATH:/home/leo/.lua-lsp/bin"
export PATH=":$PATH:/home/leo/.nvm/versions/node/v17.2.0/lib/node_modules/vscode-langservers-extracted"
export VIMRUNTIME=/usr/share/nvim/runtime
# export PATH=":$PATH:/home/leo/.nvm/versions/node/v17.2.0/lib/node_modules/vscode-langservers-extracted/bin"
SAVEHIST=1000  # Save most-recent 1000 lines
HISTFILE=~/.zsh_history

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    tmux|screen|xterm-color|*-256color) color_prompt=yes;;
esac


export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# aliases
alias wt="git worktree"
alias audio-fix="systemctl --user restart pipewire.service"
alias fix-screen="xrandr --output Virtual-1 --mode 1920x1080"
alias 1440-screen="xrandr --output Virtual-1 --mode 2560x1440_142.00"


# pnpm
export PNPM_HOME="/home/leo/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
#
#
#Tmux history 
# avoid duplicates..
export HISTCONTROL=ignoredups:erasedups

# append history entries..
setopt appendhistory

setopt auto_cd
# After each command, save and reload history
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"


bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
export PATH="/home/leo/.local/bin:/home/leo/.pyenv/shims:/home/leo/.pyenv/bin:::::/home/leo/.deno/bin::/home/leo/.wasmer/bin:/home/leo/.nvm/versions/node/v20.11.0/bin:/home/leo/.deno/bin:/home/leo/.wasmtime/bin:/home/leo/.pyenv/bin:::::/home/leo/.deno/bin::/home/leo/.wasmer/bin:/home/leo/.nvm/versions/node/v20.11.0/bin:/home/leo/.deno/bin:/home/leo/.wasmtime/bin:/bin:::::/home/leo/.deno/bin::/home/leo/.wasmer/bin:/home/leo/.nvm/versions/node/v20.11.0/bin:/home/leo/.deno/bin:/home/leo/.wasmtime/bin:/home/leo/.local/share/pnpm:/bin:::::/home/leo/.deno/bin::/home/leo/.wasmer/bin:/home/leo/.nvm/versions/node/v20.11.0/bin:/home/leo/.deno/bin:/home/leo/.wasmtime/bin:/home/leo/.cargo/bin:/home/leo/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/home/leo/.wasmer/globals/wapm_packages/.bin:/usr/local/go/bin:/home/leo/go/bin:/home/leo/.local/bin:/home/leo/.local/bin/lnd:/home/leo/.lua-lsp/bin:/home/leo/.nvm/versions/node/v17.2.0/lib/node_modules/vscode-langservers-extracted:/home/leo/.wasmer/globals/wapm_packages/.bin:/usr/local/go/bin:/home/leo/go/bin:/home/leo/.local/bin:/home/leo/.local/bin/lnd:/home/leo/.lua-lsp/bin:/home/leo/.nvm/versions/node/v17.2.0/lib/node_modules/vscode-langservers-extracted:/home/leo/.wasmer/globals/wapm_packages/.bin:/usr/local/go/bin:/home/leo/go/bin:/home/leo/.local/bin:/home/leo/.local/bin/lnd:/home/leo/.lua-lsp/bin:/home/leo/.nvm/versions/node/v17.2.0/lib/node_modules/vscode-langservers-extracted:/home/leo/.wasmer/globals/wapm_packages/.bin:/usr/local/go/bin:/home/leo/go/bin:/home/leo/.local/bin:/home/leo/.local/bin/lnd:/home/leo/.lua-lsp/bin:/home/leo/.nvm/versions/node/v17.2.0/lib/node_modules/vscode-langservers-extracted"
export PATH="$HOME/zig-linux-x86_64-0.14.0-dev/:$PATH"
source ~/powerlevel10k/powerlevel10k.zsh-theme
