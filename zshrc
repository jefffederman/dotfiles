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

my_prompt () {
local ruby_version="$(ruby -v | cut -d' ' -f 1-2)"
local default_user=`whoami`
local username=""
if [[ "$USER" != "$default_user" ]]; then
  username="%n"
fi

# The `__git_ps1` function takes three string params:
# • Text before the git output
# • Text after the git output
# • Format for the git output

__git_ps1 "${VIRTUAL_ENV:+$fg[magenta](`basename $VIRTUAL_ENV`) $reset_color}$fg[black]$username$reset_color $fg[green]%~$reset_color $fg[black]$ruby_version$reset_color " "
%{$fg_bold[magenta]%}❯%{$fg_no_bold[blue]%}❯%{$fg[cyan]%}❯%{$reset_color%} " "%s"
}

precmd_functions+=('my_prompt')

alias m2='mate'
alias ls='ls -Ga'
alias bx='bundle exec'
# See http://stackoverflow.com/questions/4822471/count-number-of-lines-in-a-git-repository
alias linesofcode='cloc $(git ls-files)'

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
