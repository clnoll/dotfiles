# Based on oh-my-zsh/themes/robbyrussell.zsh-theme
# But using __git_ps1 from https://github.com/git/git/blob/master/contrib/completion/git-prompt.sh
source ~/src/3p/git/contrib/completion/git-prompt.sh
export GIT_PS1_SHOWDIRTYSTATE=yes
export GIT_PS1_UNSTAGED="🐉  "
export GIT_PS1_STAGED="🐠  "
PROMPT="%(?:%{$fg_bold[cyan]%}%c:%{$fg[red]%}%c)%{$reset_color%}"
PROMPT+='%{$fg[red]%}$(__git_ps1 "(%s)")%{$reset_color%} '
