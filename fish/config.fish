#! /bin/sh
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
set fish_greeting
export EDITOR=nvim || export EDITOR=vim
source $HOME/.config/fish/shortcuts.fish
source $HOME/.config/fish/colors.fish
set -gx PATH $HOME/.local/bin /usr/local/bin $PATH
set -gx PATH $HOME/.local/bin $HOME/.local/bin/go/bin /usr/local/bin $PATH
set fish_color_valid_path --bold

alias ls='exa -l --icons --git'
alias ll='exa -l --icons -a --git'

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/user/.local/bin/google-cloud-sdk/path.fish.inc' ]; . '/home/user/.local/bin/google-cloud-sdk/path.fish.inc'; end
