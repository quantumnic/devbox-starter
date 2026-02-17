# devbox-starter .zshrc

# Prompt
PROMPT='%F{cyan}%~%f %F{green}❯%f '

# History
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history
setopt HIST_IGNORE_DUPS SHARE_HISTORY

# Aliases — Git
alias gs='git status -sb'
alias gd='git diff'
alias gl='git log --oneline -20'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gpl='git pull --rebase'

# Aliases — Docker
alias dc='docker compose'
alias dcu='docker compose up -d'
alias dcd='docker compose down'
alias dcl='docker compose logs -f'

# Aliases — General
alias ll='ls -lah'
alias ..='cd ..'
alias ...='cd ../..'

# fzf
[ -f /usr/share/doc/fzf/examples/key-bindings.zsh ] && source /usr/share/doc/fzf/examples/key-bindings.zsh

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"
