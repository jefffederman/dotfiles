# ZSH Theme - Preview: http://gyazo.com/8becc8a7ed5ab54a0262a470555c3eed.png
local return_code="%(?..%{$fg[green]%}%? ↵%{$reset_color%})"

local user_host='%{$terminfo[bold]$fg[black]%}%n%{$reset_color%}'
local current_dir='%{$terminfo[bold]$fg[green]%} %~%{$reset_color%}'
local ruby_version="%{$fg[black]%}$(ruby --version | cut -d' ' -f 1-2)%{$reset_color%}"
local git_branch='$(git_prompt_info)%{$reset_color%}'

PROMPT="${user_host} ${current_dir} ${ruby_version} ${git_branch}
$%b "
RPS1="${return_code}"

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[blue]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX=" %{$reset_color%}"
