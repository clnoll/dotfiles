### oh-my-zsh config
export ZSH="/Users/catherine/.oh-my-zsh"
plugins=(git)
source $ZSH/oh-my-zsh.sh


source ~/dotfiles/zsh/prompt.sh
source ~/dotfiles/zsh/aliases.sh
source ~/dotfiles/lib.sh


export HISTFILE=~/.eternal_shell_history
export PATH=/opt/X11/bin:~/.cargo/bin:/Applications/SnowSQL.app/Contents/MacOSå:$PATH
export PATH=~/bin:/opt/homebrew/opt/coreutils/libexec/gnubin:/opt/homebrew/bin:$PATH
export SHELL=/opt/homebrew/bin/zsh
export TMUX_EXECUTABLE=/opt/homebrew/bin/tmux
export GIT_CONFIG_GLOBAL=~/dotfiles/gitconfig
export BAT_THEME=Dracula
export GIT_SEQUENCE_EDITOR=emacsclient
export GH_PAGER=delta
export POETRY_VIRTUALENVS_IN_PROJECT=true

export EDITOR="emacs -nw -q"

 [ -n "$TMUX" ] && $TMUX_EXECUTABLE set-option prefix C-z >/dev/null

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

eval "$(pyenv init --path)"
eval "$(pyenv init -)"

export PATH=/opt/homebrew/opt/node@16/bin:$PATH
export DOCKER_BUILD_PLATFORM=linux/arm64
export DOCKER_BUILD_ARCH=arm64
export ALPINE_IMAGE=arm64v8/alpine:3.14
export POSTGRES_IMAGE=arm64v8/postgres:13-alpine
export JDK_VERSION=17


function pycharm() {
    /Applications/PyCharm.app/Contents/MacOS/pycharm "$@" 1>/dev/null 2>/dev/null
}

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
