#Profile file. Runs on login. 
export ZDOTDIR="$HOME/.config/zsh"
export PATH="$HOME/.local/bin:$PATH"

#Startx Automatically
if [[ -z "$DISPLAY" ]] && [[ $(tty) = /dev/tty1 ]]; then
startx
fi
