#!/usr/bin/env bash
set -x
dotfiles_path=$(pwd)

[ -e ~/.config/zsh ] || ln -s "$dotfiles_path"/zsh ~/.config
[ -e ~/.config/wezterm ] || ln -s "$dotfiles_path"/wezterm ~/.config
[ -e ~/.config/tmux ] || ln -s "$dotfiles_path"/tmux ~/.config
[ -e ~/.config/nvim ] || ln -s "$dotfiles_path"/nvim ~/.config

nvim --headless "+Lazy! sync" +qa
