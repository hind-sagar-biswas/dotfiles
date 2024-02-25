autoload -Uz vcs_info
precmd() { vcs_info }

zstyle ':vcs_info:git:*' formats '%b '
setopt PROMPT_SUBST
PROMPT='%F{cyan}%*%f [%n] %F{blue}%~%f %F{red}${vcs_info_msg_0_}%f$ '

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt notify
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/shinigami/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

if [ -x "$(command -v lsd)" ]; then
    alias ls='lsd'
    alias ll='lsd -l'
    alias la='lsd -la'
fi

export EDITOR='nvim'
export PATH=$PATH:/home/shinigami/.cargo/bin
export PATH=$PATH:/home/shinigami/.local/bin

eval "$(zoxide init zsh)"

alias sc="source $HOME/.zshrc"  # reload zsh configuration
alias cls=clear
alias df='df -h'
alias cat=bat
alias v=nvim
alias cd=z
alias home='cd ~'
alias grep='rg --color=auto'
alias mkdir='mkdir -p'
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'
alias tn='tmux new -s'
alias ta='tmux attach -t'
alias tx='tmux kill-session -t'
alias art='php artisan'
alias fman="compgen -c | fzf | xargs man"

# Fuck Aliases
# $(thefuck --alias)

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh


# bun completions
[ -s "/home/shinigami/.bun/_bun" ] && source "/home/shinigami/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

echo ''
uwufetch

eval $(thefuck --alias)
