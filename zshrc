# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="jfederman"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export GOROOT=`go env GOROOT`
export PATH=./node_modules/.bin:/usr/local/bin:$PATH:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin:$HOME/bin:/usr/local/share/npm/bin:/.bin:$GOROOT/bin:/usr/local/opt/go/libexec/bin
export EDITOR=vim

export HISTSIZE=10000
export SAVEHIST=$HISTSIZE

alias mvim="nocorrect mvim"
alias gphm="git push heroku master"
alias bx="bundle exec"
alias fr="foreman run"
alias frbx="foreman run bundle exec"
alias bower="noglob bower"
alias m2="mate"
alias woofly_api="cd $HOME/Code/Woofly/API/woofly-api"
alias clientwoofly="cd $HOME/Code/Woofly/API/Clients/woofly-client"
alias fgbp="cd $HOME/Code/Funding_Gates/Business-Portal"
alias fgrui="cd $HOME/Code/Funding_Gates/receivables-manager-ui"

export GOPATH="$HOME/Code/golang"
### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

if [ $(command -v direnv 2>&1) ]; then
  eval "$(direnv hook zsh)"
fi
