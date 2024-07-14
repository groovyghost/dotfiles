# Set environment variables
export EDITOR=nvim
export VISUAL=$EDITOR
export HISTFILE=$ZDOTDIR/.zsh_history
export HISTSIZE=10000
export SAVEHIST=10000

# Set PATH
export PATH=$HOME/.local/bin:$HOME/.local/go/bin:$HOME/.pulumi/bin:$HOME/.cargo/bin:$HOME/.local/node-16/bin:$HOME/.local/maven-3.6.3/bin:$HOME/.local/cqlsh/bin:$HOME/.local/neovim/bin:$PATH

# Enable zsh options
autoload -Uz colors && colors
setopt extendedglob incappendhistory hist_ignore_all_dups hist_find_no_dups interactivecomments

# Download and load zinit
ZINIT_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/zinit/zinit.git"
if [[ ! -d "$ZINIT_HOME" ]]; then
  git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi
source "$ZINIT_HOME/zinit.zsh"
zinit cdreplay -q

# Load zinit plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions

eval "$(zoxide init zsh)"

autoload -Uz compinit
[ ! "$(find ~/.config/zsh/.zcompdump -mtime 1)" ] || compinit -C

source "$ZDOTDIR"/keybindings.zsh
source "$ZDOTDIR"/alias.zsh
source "$ZDOTDIR"/cs50.zsh
source <(kubectl completion zsh)
source "$ZDOTDIR"/prompt.zsh
# fnm
FNM_PATH="/home/user/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="/home/user/.local/share/fnm:$PATH"
  eval "`fnm env --use-on-cd`"
fi
