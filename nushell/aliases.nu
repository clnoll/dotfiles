alias cat = bat
alias docker-prune = docker rmi $(docker images -f "dangling=true" -q)
alias docker-rm-all = docker rm -f $(docker ps -a -q)
alias docker-clean = (docker-rm-all; docker-prune)
alias e = emacsclient -n
alias gg = git grep
alias glp = git log -p
alias grhh = git reset --hard HEAD
alias g = grep
alias grep = grep --color=auto
alias hist = tac ~/.eternal_shell_history
alias less = less -SX
alias l = less
alias ssh = ssh -A
