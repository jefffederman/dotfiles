# ZSH Theme - Preview: http://gyazo.com/8becc8a7ed5ab54a0262a470555c3eed.png
local return_code="%(?..%{$fg[green]%}%? ↵%{$reset_color%})"

local user_host='%{$terminfo[bold]$fg[black]%}%n%{$reset_color%}'
local current_dir='%{$terminfo[bold]$fg[green]%} %~%{$reset_color%}'
# 2014-07-18 rvm_ruby not displaying as is...
local rvm_ruby=''
if which rvm-prompt &> /dev/null; then
  rvm_ruby='%{$fg[black]%}$(~/.rvm/bin/rvm-prompt i v g)%{$reset_color%}'
else
  if which rbenv &> /dev/null; then
    rvm_ruby='%{$fg[black]%}$(rbenv version | sed -e "s/ (set.*$//")%{$reset_color%}'
  fi
fi
local git_branch='$(git_prompt_info)%{$reset_color%}'

PROMPT="${user_host} ${current_dir} ${rvm_ruby} ${git_branch}
$%b "
RPS1="${return_code}"

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[blue]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX=" %{$reset_color%}"
