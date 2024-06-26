export PATH=$PATH:/Users/channinghsu/.npm-global/lib/node_modules/hexo-cli/bin

export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.aliyun.com/homebrew/homebrew-bottles
export PATH="/usr/local/opt/llvm/bin:$PATH"
plugins=(git)


export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles
export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.aliyun.com/homebrew/homebrew-bottles
export HOMEBREW_NO_AUTO_UPDATE=true

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

export PATH="/opt/homebrew/opt/curl/bin:$PATH"
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
export PATH="/opt/homebrew/opt/node@14/bin:$PATH"
export PATH="/opt/homebrew/opt/qt@5/bin:$PATH"
alias gs='gh copilot suggest'
alias ge='gh copilot explain'
alias gss='git status'
alias gl='git pull'
alias gp='git push'
alias gc='git commit -v'
alias gb='git branch'
alias n='nvim'
alias t='tmux -f ~/.config/tmux.conf'
alias tmux='tmux -f ~/.config/tmux.conf'
eval "$(gh copilot alias -- zsh)"
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# eza
alias ls="eza -s Name --group-directories-first --color=always"
alias la="eza -s -a Name --group-directories-first --color=always"
alias lt="eza -T -s Name --group-directories-first --color=always"
alias ll="eza -lag -s Name --group-directories-first --time-style '+%Y-%m-%d %H:%M:%S' --color=always"
alias lg="eza -lag -s Name --group-directories-first --time-style '+%Y-%m-%d %H:%M:%S' --git --color=always"

# history setup
HISTFILE=$HOME/.zhistory
SAVEHIST=1000
HISTSIZE=999
setopt share_history 
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify

# completion using arrow keys (based on history)
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward
