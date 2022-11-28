# Based on oh-my-zsh/themes/robbyrussell.zsh-theme
# But using __git_ps1 from https://github.com/dandavison/shell-config/blob/master/3p/git-prompt.sh
source ~/src/3p/dan-shell-config/3p/git-prompt.sh
export GIT_PS1_SHOWDIRTYSTATE=yes
export GIT_PS1_UNSTAGED="🐉  "
export GIT_PS1_STAGED="🐠  "
PROMPT="%(?:%{$fg_bold[cyan]%}%c:%{$fg[red]%}%c)%{$reset_color%}"
PROMPT+='%{$fg[red]%}$(__git_ps1 "(%s)")%{$reset_color%} '
