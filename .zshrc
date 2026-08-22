pokemon-colorscripts -r --no-title

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Use powerline
USE_POWERLINE="true"
# Has weird character width
# Example:
#    is not a diamond
HAS_WIDECHARS="false"
# Source manjaro-zsh-configuration
if [[ -e /usr/share/zsh/manjaro-zsh-config ]]; then
  source /usr/share/zsh/manjaro-zsh-config
fi
# Use manjaro zsh prompt
if [[ -e /usr/share/zsh/manjaro-zsh-prompt ]]; then
  source /usr/share/zsh/manjaro-zsh-prompt
fi

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

alias ls=eza
alias ll='ls -lh'
alias la='ls -lah'
alias sc="source $HOME/.zshrc"  # reload zsh configuration
alias cls=clear
alias df='df -h'
alias sv="sudo $EDITOR"
alias v=$EDITOR
alias vi=$EDITOR
alias vim=$EDITOR
alias cd=z
alias grep='rg --color=auto'
alias mkdir='mkdir -pv'
alias cp='cp -ir'
alias mv='mv -i'
alias rm='rm -i'
alias t=tmux
alias tn='tmux new -s'
alias ta='tmux attach -t'
alias tx='tmux kill-session -t'
alias art='php artisan'
alias sys=systemctl
alias ssys="sudo systemctl"
alias p='sudo pacman'
alias install="sudo pacman -S"
alias remove="sudo pacman -Rns"
alias update="sudo pacman -Syu && sudo freshclam"
alias fman="compgen -c | fzf | xargs man"
alias mysql=mariadb
alias git-init='git init && git add . && git commit -m "Initial commit"'
alias sail='sh $([ -f sail ] && echo sail || echo vendor/bin/sail)'
alias pbcopy='xsel --input --clipboard'
alias pbpaste='xsel --output --clipboard'
alias yay=paru
alias zshcfg='v ~/.zshrc'
# alias npm=bun
# alias npx=bunx
alias py=python

# bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

eval "$(zoxide init zsh)"
eval "$(atuin init zsh)"
eval "$(phpenv init -)"
# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# composer, rofui, scripts
export PATH="$HOME/.config/composer/vendor/bin:$HOME/.config/rofi/bin:$HOME/.scripts:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$PATH:$HOME/.dotnet/tools"

export HYPRSHOT_DIR="$HOME/Pictures/Hyprshots"

export GEMINI_API_KEY="XXX"
export GOOGLE_APPLICATION_CREDENTIALS="$HOME/.keys/XXXX.json"
export GOOGLE_CLOUD_PROJECT="XXXX"
# export GOOGLE_CLOUD_LOCATION="us-central1"
export GOOGLE_CLOUD_LOCATION="global"

