# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# zmodload zsh/zprof
export PATH=$PATH:/Users/channinghsu/.npm-global/lib/node_modules/hexo-cli/bin

# export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.aliyun.com/homebrew/homebrew-bottles
export PATH="/usr/local/opt/llvm/bin:$PATH"
plugins=(git)

# alias va='NVIM_APPNAME=nvim-aya nvim' # ayaNvim 
# alias vz='NVIM_APPNAME=nvim-lazyvim nvim' # LazyVim
# alias vc='NVIM_APPNAME=nvim-nvchad nvim' # NvChad
# alias vk='NVIM_APPNAME=nvim-kickstart nvim' # Kickstart
# alias va='NVIM_APPNAME=nvim-astrovim nvim' # AstroVim
# alias vl='NVIM_APPNAME=nvim-lunarvim nvim' # LunarVim
# vv() {
#   # Assumes all configs exist in directories named ~/.config/nvim-*
#   local config=$(fd --max-depth 1 --glob 'nvim-*' ~/.config | fzf --prompt="Neovim Configs > " --height=~50% --layout=reverse --border --exit-0)
#  
#   # If I exit fzf without selecting a config, don't open Neovim
#   [[ -z $config ]] && echo "No config selected" && return
#  
#   # Open Neovim with the selected config
#   NVIM_APPNAME=$(basename $config) nvim $@
# }
function yy() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}
vv() {
  select config in my aya lazyvim kickstart nvchad astrovim lunarvim
  do NVIM_APPNAME=nvim-$config nvim $@; break; done
}
export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles
export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.aliyun.com/homebrew/homebrew-bottles
export HOMEBREW_NO_AUTO_UPDATE=true

# eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

export PATH="/opt/homebrew/opt/curl/bin:$PATH"
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
export PATH="/opt/homebrew/opt/node@14/bin:$PATH"
export PATH="/opt/homebrew/opt/qt@5/bin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/llvm/lib"
export CPPFLAGS="-I/opt/homebrew/opt/llvm/include"
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"

alias gs='gh copilot suggest'
alias ge='gh copilot explain'
alias gss='git status'
alias gp='git pull'
alias gP='git push'
alias gc='git commit -v'
alias gb='git branch'
# alias n='nvim'
alias t='tmux -f ~/.config/tmux.conf'
alias c='clear'
alias b='btop'
alias h='hexo'
alias tl='tldr'
alias neo='neofetch'
# alias tmux='tmux -f ~/.config/tmux.conf'
eval "$(gh copilot alias -- zsh)"

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# eza
alias ls="eza -s Name --group-directories-first --color=always"
alias la="eza -s -a Name --group-directories-first --color=always"
alias lt="eza -T -s Name --group-directories-first --color=always"
alias ll="eza -lag -s Name --group-directories-first --time-style '+%Y-%m-%d %H:%M:%S' --color=always"
alias lg="eza -lag -s Name --group-directories-first --time-style '+%Y-%m-%d %H:%M:%S' --git --color=always"
alias inv='nvim $(fzf -m --preview="bat --style=numbers,changes --color=always {}")'

# completion using arrow keys (based on history)
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
# Check if the history file exists, if not, create it
if [[ ! -f $HISTFILE ]]; then
  touch $HISTFILE
  chmod 600 $HISTFILE
fi

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
# __conda_setup="$('/Users/channinghsu/opt/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
# if [ $? -eq 0 ]; then
#     eval "$__conda_setup"
# else
#     if [ -f "/Users/channinghsu/opt/anaconda3/etc/profile.d/conda.sh" ]; then
#         . "/Users/channinghsu/opt/anaconda3/etc/profile.d/conda.sh"
#     else
#         export PATH="/Users/channinghsu/opt/anaconda3/bin:$PATH"
#     fi
# fi
# unset __conda_setup
# <<< conda initialize <<<
# zprof
source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
