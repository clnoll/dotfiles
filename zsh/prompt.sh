# Based on oh-my-zsh/themes/robbyrussell.zsh-theme
source ~/src/dotfiles/zsh/git-prompt.sh
export GIT_PS1_SHOWDIRTYSTATE=yes
export GIT_PS1_UNSTAGED="🐉  "
export GIT_PS1_STAGED="🐠  "
PROMPT="%(?:%{$fg_bold[cyan]%}%c:%{$fg[red]%}%c)%{$reset_color%}"
PROMPT+="%{$fg[red]%}\$(__git_ps1 '(%s)')%{$reset_color%} "
