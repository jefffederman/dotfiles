# From chruby install instructions
source /usr/local/opt/chruby/share/chruby/chruby.sh
source /usr/local/opt/chruby/share/chruby/auto.sh
chruby ruby 2.1.2

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
export NODE_PATH=$HOME/node_modules
export PATH=/usr/local/bin:$PATH:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin:$HOME/bin:/usr/local/share/npm/bin:$NODE_PATH/.bin
export EDITOR=vim

alias mvim="nocorrect mvim"
alias python3="nocorrect python3"
alias gphm="git push heroku master"
alias bx="bundle exec"
alias fr="foreman run"
alias frbx="foreman run bundle exec"
alias bower="noglob bower"
alias m2="mate"
alias woofly_api="cd $HOME/Dropbox/Alice_Lam/Woofly/API/woofly_api"
alias fgbp="cd $HOME/Code/Funding_Gates/Business-Portal"

export GOPATH="$HOME/Code/golang"
### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
