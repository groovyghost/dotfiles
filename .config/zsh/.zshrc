# Basic stuff
source $ZDOTDIR/zsh-autosuggestions/zsh-autosuggestions.zsh
source $ZDOTDIR/aliasrc

#ZSH Prompt (typewritten)
fpath+=$HOME/.config/zsh/typewritten
autoload -Uz promptinit; promptinit
prompt typewritten
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'

#History
export HISTFILE=~/.cache/.zsh_history
export HISTSIZE=1000000   # the number of items for the internal history list
export SAVEHIST=1000000   # maximum number of items for the history file
setopt HIST_IGNORE_ALL_DUPS  # do not put duplicated command into history list
setopt HIST_SAVE_NO_DUPS  # do not save duplicated command
setopt HIST_REDUCE_BLANKS  # remove unnecessary blanks
setopt INC_APPEND_HISTORY_TIME  # append command to history file immediately after execution
setopt EXTENDED_HISTORY  # record command start time
