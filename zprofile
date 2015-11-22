# Set up chruby
if [ -f "/usr/share/chruby/chruby.sh" ]; then
  # Normal installations
  source /usr/share/chruby/chruby.sh
  source /usr/share/chruby/auto.sh
elif [ -f "/usr/local/opt/chruby/share/chruby/chruby.sh" ]; then
  # OS X + HomeBrew installations
  source /usr/local/opt/chruby/share/chruby/chruby.sh
  source /usr/local/opt/chruby/share/chruby/auto.sh

  # See chruby#160; chruby uses preexec, but prompt is printed between precmd
  # and preexec. So, just run chruby_auto twice and my prompt will match correctly.
  precmd_functions+=("chruby_auto")
  [ -f ~/.ruby-version ] && chruby $(cat ~/.ruby-version)
  [ -f ./.ruby-version ] && chruby $(cat ./.ruby-version)
fi

# For python virtualenvs
export WORKON_HOME="$HOME/Code/virtualenvs"
source /usr/local/bin/virtualenvwrapper.sh
