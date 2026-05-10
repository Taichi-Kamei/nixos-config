
if [[ "$TERM" != "linux" ]]; then
  if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
  fi
fi

export ZSH="$HOME/.oh-my-zsh"
plugins=(git archlinux)
source $ZSH/oh-my-zsh.sh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

if [[ "$TERM" != "linux" ]]; then
  source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
  source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
  source /usr/share/fzf/key-bindings.zsh
  source /usr/share/fzf/completion.zsh
else
  PROMPT='%n@%m %~ > '
fi

export QSYS_ROOTDIR="/home/ta1/.cache/yay/quartus-free/pkg/quartus-free-quartus/opt/intelFPGA/25.1/quartus/sopc_builder/bin"
export TERMINAL=alacritty
export PATH="$HOME/.local/share/nvim/mason/bin:$PATH"

alias n="nvim"
alias l="clear"
alias z="source ~/.zshrc"
alias rebuild="sudo nixos-rebuild switch --flake .#Melon"
