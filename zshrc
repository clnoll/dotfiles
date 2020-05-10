### oh-my-zsh config
export ZSH="/Users/catherine/.oh-my-zsh"
plugins=(git)
source $ZSH/oh-my-zsh.sh

### Personal config
export SHELL=/usr/local/bin/zsh
export HISTFILE=~/.eternal_shell_history


## Prompt

# Based on oh-my-zsh/themes/robbyrussell.zsh-theme
# But using __git_ps1 from https://github.com/git/git/blob/master/contrib/completion/git-prompt.sh
source ~/src/3p/git/contrib/completion/git-prompt.sh
export GIT_PS1_SHOWDIRTYSTATE=yes
export GIT_PS1_UNSTAGED="અ "
export GIT_PS1_STAGED="જ "
PROMPT="%(?:%{$fg_bold[cyan]%}%c:%{$fg[red]%}%c)%{$reset_color%}"
PROMPT+='%{$fg[red]%}$(__git_ps1 "(%s)")%{$reset_color%} '


## Aliases
source ~/dotfiles/alias.sh
