# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory autocd nomatch
#bindkey -e
# Vim key bindings
# https://danielmiessler.com/blog/enhancements-to-shell-and-vim-productivity
bindkey -v
bindkey -M viins 'jj' vi-cmd-mode
bindkey '^R' history-incremental-search-backward
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

# Yarn
export PATH="$PATH:$HOME/.yarn/bin"

# Me
export PATH="$PATH:$HOME/bin"
if type nvim > /dev/null 2>&1; then
  alias vim='nvim'
  export EDITOR='nvim'
else
  export EDITOR='vim'
fi

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

export TECTONIC_KUBE_CONFIG='/Users/jefffederman/Code/Kubernetes/clusters/Tectonic/kubeconfig'
export KUBECONFIG=$TECTONIC_KUBE_CONFIG
export TILLER_NAMESPACE=default

alias m2='mate'
alias ls='ls -Ga'
alias bx='bundle exec'
# See http://stackoverflow.com/questions/4822471/count-number-of-lines-in-a-git-repository
alias linesofcode='cloc $(git ls-files)'

# Docker
alias cleancontainers='docker rm $(docker ps -aq)'
alias dco="docker-compose"
function dx() { docker exec -ti $(docker ps -f name=$1 -q) $2 }

docker_running=$(docker-machine ls | grep default)
if [[ "$docker_running" == *"Stopped"* ]]
then
  docker-machine start default
  eval "$(docker-machine env default)"
  env | grep "DOCKER_HOST"
elif [[ "$docker_running" == *"Running"* ]]
then
  eval "$(docker-machine env default)"
fi

## Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# fbr - checkout git branch
fbr() {
  local branches branch
  branches=$(git branch -vv) &&
    branch=$(echo "$branches" | fzf +m) &&
    git checkout $(echo "$branch" | awk '{print $1}' | sed "s/.* //")
}

# fe [FUZZY PATTERN] - Open the selected file with the default editor
#   - Bypass fuzzy finder if there's only one match (--select-1)
#   - Exit if there's no match (--exit-0)
fe() {
  local files
  IFS=$'\n' files=($(fzf-tmux --query="$1" --multi --select-1 --exit-0))
  [[ -n "$files" ]] && ${EDITOR:-vim} "${files[@]}"
}

# Namely
export PATH="node_modules/.bin:$PATH"
export PLATFORM=~/Code/platform

refresh_branch() {
  ruby $HOME/Scripts/refresh_branch.rb
}

# Browse chrome history
fchr() {
  local cols sep
  cols=$(( COLUMNS / 3 ))
  sep='{{::}}'

  # Copy History DB to circumvent the lock
  # - See http://stackoverflow.com/questions/8936878 for the file path
  cp -f ~/Library/Application\ Support/Google/Chrome/Default/History /tmp/h

  sqlite3 -separator $sep /tmp/h \
    "select substr(title, 1, $cols), url
     from urls order by last_visit_time desc" |
  awk -F $sep '{printf "%-'$cols's  \x1b[36m%s\n", $1, $2}' |
  fzf --ansi --multi | sed 's#.*\(https*://\)#\1#' | xargs open
}

# Browse Safari history
# See also http://2016.padjo.org/tutorials/sqlite-your-browser-history/
fsaf() {
  local cols sep
  cols=$(( COLUMNS / 3 ))
  sep='{{::}}'

  # Copy History DB to circumvent the lock
  # - See http://stackoverflow.com/questions/8936878 for the file path
  cp -f ~/Library/Safari/History.db /tmp/h

  sqlite3 -separator $sep /tmp/h \
    "select substr(title, 1, $cols), url
     from history_visits inner join history_items
     on history_items.id = history_visits.history_item
     order by visit_time desc" |
  awk -F $sep '{printf "%-'$cols's  \x1b[36m%s\n", $1, $2}' |
  fzf --ansi --multi | sed 's#.*\(https*://\)#\1#' | xargs open
}

add_remote() {
  git remote add $1 \
    $(ruby -r uri -e 'url = URI.parse(URI.encode(ARGV[0])); \
    origin_handle = url.path.match(/(\w+)\//)[1]; \
    puts ARGV[0].gsub(origin_handle, ARGV[1].downcase)' \
    $(git remote get-url origin) $1)
}

delete_pod() {
  kubectl -n hpac delete pod $1 --now
}

# namely/namely specific for now
alias gitwa='git diff --word-diff=porcelain develop | grep -e "^+[^+]" | wc -w | xargs'
alias gitwd='git diff --word-diff=porcelain develop | grep -e "^-[^-]" | wc -w | xargs'
alias gitw='echo $(($(gitwa) - $(gitwd)))'
