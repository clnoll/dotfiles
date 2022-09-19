let-env config = ($env.config | merge {
  {
    show_banner: false
  }
})


source cnoll-env.nu
source prompt.nu
source aliases.nu

# Sep 2022. We don't know why this is necessary.
# Without it, in tmux, if you try to send a tmux
# keyboard shortcut using the terminal emulator
# (i.e. a keybinding you've configured in alacritty.yml
# or iTerm profiles.json), then it doesn't go
# to tmux (the bytes just get printed to the screen).
# There's also something going on with ~/src/3p/tmux/tmux_arm
# where it's being set as TMUX_EXECUTABLE.
zsh -c 'tmux set-option prefix C-z'

