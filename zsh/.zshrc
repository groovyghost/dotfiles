#zmodload zsh/zprof # For Profiling ZSH begin

export EDITOR=nvim || export EDITOR=vim
export PATH=/opt/homebrew/bin:$HOME/.local/bin:$HOME/.local/bin/go/bin:$HOME/.cargo/bin:$HOME/.local/gradle/bin:$PATH
export HISTFILE=$ZDOTDIR/.zsh_history
# commands zsh will load to memory.
export HISTSIZE=10000
# How many commands history will save on file.
export SAVEHIST=10000
# History won't save duplicates.
setopt HIST_IGNORE_ALL_DUPS
# History won't show duplicates on search.
setopt HIST_FIND_NO_DUPS
# For Prompt
# Load colors for zsh
autoload -Uz colors && colors
setopt prompt_subst
# Robbyrussell
PROMPT="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ ) %{$fg[cyan]%}%c%{$reset_color%} "
RPROMPT='%{$fg_bold[green]%} $(git_prompt_info)%{$reset_color%}'
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[yellow]%}✗"
# Enable completion for smaller case letters
zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'r:|[._-.]=** r:|=**'
# Run cd automatically when a path is typed
setopt auto_cd
# allows you to type Bash style comments on your command line
setopt interactivecomments
# Plugin list to be sources
PLUGINS=(git
  zsh-autosuggestions
  key-bindings
  fast-syntax-highlighting/fast-syntax-highlighting.plugin)

for plugin in "${PLUGINS[@]}"; do
  if [[ -f "$ZDOTDIR"/plugins/"$plugin".zsh ]]; then
    source "$ZDOTDIR"/plugins/"$plugin".zsh
  else
    printf "\033[1;31m "$plugin" Plugin - not found\033[0m\n"
  fi
done
fpath=("$ZDOTDIR"/completions $fpath)
# Source zoxide & aliases
eval "$(zoxide init zsh)"
source "$ZDOTDIR"/zsh_alias
# Load completions (Runs if old than one day)
autoload -Uz compinit
[ ! "$(find ~/.config/zsh/.zcompdump -mtime 1)" ] || compinit
compinit -C
# zprof
