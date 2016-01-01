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

# Elixir version manager
[[ -s $HOME/.kiex/scripts/kiex ]] && source $HOME/.kiex/scripts/kiex

setopt prompt_subst
autoload -U colors && colors

my_prompt () {
  local ruby_version="$(ruby -v | cut -d' ' -f 1-2)"
  local default_user=`whoami`
  local username=""
  if [[ "$USER" != "$default_user" ]]; then
    username="%n"
  fi

  local venv_segment="%F{magenta}${VIRTUAL_ENV:+(`basename $VIRTUAL_ENV`) }%f"
  local user_segment="%F{black}$username%f"
  local path_segment="%F{green}%~%f"
  local ruby_segment="%F{black}$ruby_version%f"
  local prompt_segment="%F{61}❯%f%F{blue}❯%f%F{cyan}❯%f "

  # See http://ithaca.arpinum.org/2013/01/02/git-prompt.html
  # The `__git_ps1` function takes three string params:
  # • Text before the git output
  # • Text after the git output
  # • Format for the git output

  __git_ps1 "$venv_segment$user_segment $path_segment $ruby_segment " "
$prompt_segment" "%s"
}

precmd_functions+=('my_prompt')

alias m2='mate'
alias ls='ls -Ga'
alias bx='bundle exec'
# See http://stackoverflow.com/questions/4822471/count-number-of-lines-in-a-git-repository
alias linesofcode='cloc $(git ls-files)'

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
