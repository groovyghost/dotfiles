export EDITOR="nvim"
export VISUAL="nvim"
export BROWSER="brave-browser"
export HISTFILE=$ZDOTDIR/.zsh_history
export PATH=/opt/homebrew/bin:$HOME/.local/bin:$HOME/.local/bin/go/bin:$HOME/.cargo/bin:$HOME/.local/gradle/bin:$PATH
export HISTSIZE=10000
export SAVEHIST=10000

autoload -Uz colors && colors

setopt HIST_IGNORE_ALL_DUPS # No duplicates in history
setopt HIST_FIND_NO_DUPS # No duplicates in history
setopt prompt_subst
setopt auto_cd # cd with path only
setopt interactivecomments # bash style comments

parse_git_status() {
  STATUS="$(git status 2> /dev/null)"
  if [[ $? -ne 0 ]]; then printf ""; return; fi
  if echo "${STATUS}" | grep -c "renamed:"          &> /dev/null; then printf "󰅬 "; else printf ""; fi
  if echo "${STATUS}" | grep -c "branch is ahead:"  &> /dev/null; then printf " "; else printf ""; fi
  if echo "${STATUS}" | grep -c "new file:"         &> /dev/null; then printf " "; else printf ""; fi
  if echo "${STATUS}" | grep -c "Untracked files:"  &> /dev/null; then printf " "; else printf ""; fi
  if echo "${STATUS}" | grep -c "deleted:"          &> /dev/null; then printf " "; else printf ""; fi
  if echo "${STATUS}" | grep -c "modified:"         &> /dev/null; then printf "󱨧 "; else printf ""; fi
}

parse_git_branch(){
  git rev-parse --abbrev-ref HEAD 2> /dev/null
}

PROMPT="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ ) %{$fg[cyan]%}%c%{$reset_color%} "
RPROMPT='%{$fg_bold[green]%}$(parse_git_branch) %{$fg[yellow]%}$(parse_git_status)%{$reset_color%}'

# Plugin list to be sources
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

fpath=("$ZDOTDIR"/completions $fpath)
# Source zoxide & aliases
eval "$(zoxide init zsh)"
source "$ZDOTDIR"/zsh_alias
# Load completions (Runs if old than one day)
autoload -Uz compinit
[ ! "$(find ~/.config/zsh/.zcompdump -mtime 1)" ] || compinit
compinit -C
autopair-init
# zprof
