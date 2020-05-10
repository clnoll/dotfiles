### oh-my-zsh config
export ZSH="/Users/catherine/.oh-my-zsh"
plugins=(git)
source $ZSH/oh-my-zsh.sh

### Personal config
source ~/dotfiles/zsh_prompt.sh
source ~/dotfiles/zsh_aliases.sh

export SHELL=/usr/local/bin/zsh
export HISTFILE=~/.eternal_shell_history
export PATH=~/bin:/usr/local/opt/coreutils/libexec/gnubin:/usr/local/bin:/opt/X11/bin:~/joya/mc-web/N/google-cloud-sdk/bin:~/.cargo/bin:/Applications/SnowSQL.app/Contents/MacOS:$PATH

[ -n "$TMUX" ] && tmux set-option prefix C-z >/dev/null
