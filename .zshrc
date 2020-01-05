GOPATH=$HOME/go
# powerline for cmd prompt
function powerline_precmd() {
    PS1="$($GOPATH/bin/powerline-go -error $? -shell zsh)"
}

function install_powerline_precmd() {
    for s in "${precmd_functions[@]}"; do
	if [ "$s" = "powerline_precmd" ]; then
	    return
	fi
    done
    precmd_functions+=(powerline_precmd)
}

export ZSH="/home/kooxx078/.oh-my-zsh"

ZSH_THEME="agnoster"

plugins=(git)

source $ZSH/oh-my-zsh.sh

KEYTIMEOUT=1

bindkey -v

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias activate='source .venv/bin/activate'
alias vi='nvim'
alias vim='nvim'
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias gs='git status'

if [ "$TERM" != "linux" ]; then
    install_powerline_precmd
fi

eval `dircolors ~/Git/dircolors-solarized/dircolors.ansi-dark`

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# show vi mode at cmd prompt
function zle-line-init zle-keymap-select {
    RPS1="${${KEYMAP/vicmd/-- NORMAL --}/(main|viins)/-- INSERT --}"
    RPS2=$RPS1
    zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select

cd $HOME
