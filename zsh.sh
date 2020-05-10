### oh-my-zsh config
export ZSH="/Users/catherine/.oh-my-zsh"
plugins=(git)
source $ZSH/oh-my-zsh.sh

### Personal config
source ~/dotfiles/zsh_prompt.sh
source ~/dotfiles/zsh_aliases.sh

export SHELL=/usr/local/bin/zsh
export HISTFILE=~/.eternal_shell_history
export PATH=~/bin:$PATH
