# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

zstyle :compinstall filename '/home/antoine/.zshrc'

autoload -Uz compinit
compinit
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:/home/antoine/.local/bin:$PATH

export FZF_DEFAULT_COMMAND='rg --files --no-ignore-vcs --hidden'
export TERMINAL=kitty

alias ll="ls -lh --color=auto"
alias lla="ls -lah --color=auto"
alias lum="ddcutil setvcp 10 "
alias top="bpytop"
alias dg="cd \"\$(find * -type d | fzf)\""
alias update="yay -Syu --noconfirm"
alias install="yay -S --noconfirm"
alias todo="nvim ~/notes/todo.md"
alias notes="nvim ~/notes/divers.md"
alias vpn="protonvpn-cli"
alias btcasque="bluetoothctl connect 88:C9:E8:69:D6:3E"
alias gdu="gdu -c"
alias icat="kitten icat"
alias wifir="sudo rmmod mt7921e && sudo modprobe mt7921e"
alias hn="hackernews_tui"
alias wiki="wiki-tui"


autoload -U edit-command-line
zle -N edit-command-line
bindkey -v
bindkey '^xe' edit-command-line
bindkey '^x^e' edit-command-line

autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search # Up
bindkey "^[[B" down-line-or-beginning-search # Down

zstyle ':completion:*' menu select

export EDITOR=nvim
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
