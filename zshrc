# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory autocd nomatch
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/Users/jefffederman/.zshrc'

autoload -Uz compinit
compinit
# Case insensitive completion
zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}'
# End of lines added by compinstall

export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

# Prompt with git and virtualenv support, see https://www.codefellows.org/blog/bash-for-fun-profit

source ~/.zsh/git-prompt.sh
export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWUNTRACKEDFILES=true
export GIT_PS1_SHOWCOLORHINTS=true

# Go
export GOPATH=$HOME/Code/Go
export PATH=/usr/local/sbin:$PATH:$GOPATH/bin

setopt prompt_subst
autoload -U colors && colors

local ruby_version="$(ruby -v | cut -d' ' -f 1-2)"

precmd () { __git_ps1 "${VIRTUAL_ENV:+$fg[magenta](`basename $VIRTUAL_ENV`) $reset_color}$fg[black]%n$reset_color $fg[green]%~$reset_color $fg[black]$ruby_version$reset_color " "
$%b " "%s" }

alias m2='mate'
alias ls='ls -Ga'
alias bx='bundle exec'

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
