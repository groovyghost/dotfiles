#zmodload zsh/zprof

# Editor settings
export EDITOR="nvim"
export VISUAL="nvim"

# History config
export HISTFILE=$ZDOTDIR/.zsh_history
export HISTSIZE=10000
export SAVEHIST=10000

# Path config
export PATH=$PATH:$HOME/.local/bin:$HOME/.local/bin/go/bin:$HOME/.cargo/bin:$HOME/.local/gradle/bin:$HOME/.local/bin/istio-1.19.0/bin:$HOME/.pulumi/bin

# Some zsh options
autoload -Uz colors && colors
setopt extendedglob
setopt incappendhistory # Save history incrementally
setopt HIST_IGNORE_ALL_DUPS # No duplicates in history
setopt HIST_FIND_NO_DUPS # No duplicates in history
setopt auto_cd # cd with path only
setopt interactivecomments # bash style comments

# Plugin list to be sourced
PLUGINS=(zsh-autosuggestions
  key-bindings
  fast-syntax-highlighting/fast-syntax-highlighting.plugin
  autopair)

for plugin in "${PLUGINS[@]}"; do
  if [[ -f "$ZDOTDIR"/plugins/"$plugin".zsh ]]; then
    source "$ZDOTDIR"/plugins/"$plugin".zsh
  else
    printf "\033[1;31m "$plugin" Plugin - not found\033[0m\n"
  fi
done

# Source zoxide & aliases
eval "$(zoxide init zsh)"
source "$ZDOTDIR"/alias.zsh

# Load completions (Runs if old than one day)
autoload -Uz compinit
[ ! "$(find ~/.config/zsh/.zcompdump -mtime 1)" ] || compinit
compinit -C
autopair-init

# Prompt config
source ~/.config/zsh/prompt.zsh

# Zsh profiling
# zprof
