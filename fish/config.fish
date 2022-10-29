#! /bin/sh
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
set fish_greeting
export EDITOR=nvim || export EDITOR=vim
source $HOME/.config/fish/shortcuts.fish
source $HOME/.config/fish/colors.fish
set -gx PATH $HOME/.local/bin /usr/local/bin $PATH
set -gx PATH $HOME/.local/bin $HOME/.local/bin/go/bin /usr/local/bin $PATH
set fish_color_valid_path --bold

alias la='ls -lha'
alias df='df -h'
alias du='du -ch'
