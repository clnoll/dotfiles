### oh-my-zsh config
export ZSH="/Users/catherine/.oh-my-zsh"
plugins=(git)
source $ZSH/oh-my-zsh.sh

### Personal config
source ~/dotfiles/zsh_prompt.sh
source ~/dotfiles/zsh_aliases.sh
source ~/dotfiles/lib.sh

export SHELL=/usr/local/bin/zsh
export HISTFILE=~/.eternal_shell_history
export PATH=~/bin:/usr/local/opt/coreutils/libexec/gnubin:/usr/local/bin:/opt/X11/bin:~/joya/mc-web/N/google-cloud-sdk/bin:~/.cargo/bin:/Applications/SnowSQL.app/Contents/MacOS:$PATH
export EDITOR="emacs -nw -q"

[ -n "$TMUX" ] && tmux set-option prefix C-z >/dev/null

# unsetopt share_history

function insert-fzf-path-in-command-line() {
    # https://github.com/Julian/dotfiles/blob/4da75802dd2d9a7246c8b7dbbaed8a99c315a2ed/.config/zsh/commands.zsh#L44-L54
    # Copied from https://github.com/garybernhardt/selecta/blob/master/EXAMPLES.md
    local selected_path
    echo
    selected_path=$(fd --type file | fzf) || return
    LBUFFER+="${(q-)selected_path}"
    zle reset-prompt
}

zle -N insert-fzf-path-in-command-line
bindkey "^F" insert-fzf-path-in-command-line
