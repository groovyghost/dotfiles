# Documentation:
# http://zsh.sourceforge.net/Doc/Release/Zsh-Line-Editor.html
# http://zsh.sourceforge.net/Doc/Release/Zsh-Line-Editor.html#Zle-Builtins
# http://zsh.sourceforge.net/Doc/Release/Zsh-Line-Editor.html#Standard-Widgets

# Ensure the terminal is in application mode when zle is active
if (( ${+terminfo[smkx]} )) && (( ${+terminfo[rmkx]} )); then
  function zle-line-init() {
    echoti smkx
  }
  function zle-line-finish() {
    echoti rmkx
  }
  zle -N zle-line-init
  zle -N zle-line-finish
fi

# Use emacs key bindings
bindkey -e

# Bind keys for history navigation
if [[ -n "${terminfo[kpp]}" ]]; then
  bindkey -M emacs "${terminfo[kpp]}" up-line-or-history
fi
if [[ -n "${terminfo[knp]}" ]]; then
  bindkey -M emacs "${terminfo[knp]}" down-line-or-history
fi

# Fuzzy find history
if [[ -n "${terminfo[kcuu1]}" ]]; then
  autoload -U up-line-or-beginning-search
  zle -N up-line-or-beginning-search
  bindkey -M emacs "${terminfo[kcuu1]}" up-line-or-beginning-search
fi
if [[ -n "${terminfo[kcud1]}" ]]; then
  autoload -U down-line-or-beginning-search
  zle -N down-line-or-beginning-search
  bindkey -M emacs "${terminfo[kcud1]}" down-line-or-beginning-search
fi

# Navigation keys
if [[ -n "${terminfo[khome]}" ]]; then
  bindkey -M emacs "${terminfo[khome]}" beginning-of-line
fi
if [[ -n "${terminfo[kend]}" ]]; then
  bindkey -M emacs "${terminfo[kend]}" end-of-line
fi

# Completion menu navigation
if [[ -n "${terminfo[kcbt]}" ]]; then
  bindkey -M emacs "${terminfo[kcbt]}" reverse-menu-complete
fi

# Deletion keys
bindkey -M emacs '^?' backward-delete-char
if [[ -n "${terminfo[kdch1]}" ]]; then
  bindkey -M emacs "${terminfo[kdch1]}" delete-char
else
  bindkey -M emacs "^[[3~" delete-char
  bindkey -M emacs "^[3;5~" delete-char
fi

# Additional key bindings
bindkey -M emacs '^[[3;5~' kill-word              # [Ctrl-Delete] - delete whole forward-word
bindkey -M emacs '^[[1;5C' forward-word           # [Ctrl-RightArrow] - move forward one word
bindkey -M emacs '^[[1;5D' backward-word          # [Ctrl-LeftArrow] - move backward one word

# Miscellaneous key bindings
bindkey '\ew' kill-region                         # [Esc-w] - Kill from the cursor to the mark
bindkey -s '\el' 'ls\n'                           # [Esc-l] - run command: ls
bindkey '^r' history-incremental-search-backward  # [Ctrl-r] - Search backward incrementally
bindkey ' ' magic-space                           # [Space] - don't do history expansion

# Edit the current command line in $EDITOR
autoload -U edit-command-line
zle -N edit-command-line
bindkey '\C-x\C-e' edit-command-line

# File rename magic
bindkey "^[m" copy-prev-shell-word
# Documentation:
# http://zsh.sourceforge.net/Doc/Release/Zsh-Line-Editor.html
# http://zsh.sourceforge.net/Doc/Release/Zsh-Line-Editor.html#Zle-Builtins
# http://zsh.sourceforge.net/Doc/Release/Zsh-Line-Editor.html#Standard-Widgets

# Ensure the terminal is in application mode when zle is active
if (( ${+terminfo[smkx]} )) && (( ${+terminfo[rmkx]} )); then
  function zle-line-init() {
    echoti smkx
  }
  function zle-line-finish() {
    echoti rmkx
  }
  zle -N zle-line-init
  zle -N zle-line-finish
fi

# Use emacs key bindings
bindkey -e

# Bind keys for history navigation
if [[ -n "${terminfo[kpp]}" ]]; then
  bindkey -M emacs "${terminfo[kpp]}" up-line-or-history
fi
if [[ -n "${terminfo[knp]}" ]]; then
  bindkey -M emacs "${terminfo[knp]}" down-line-or-history
fi

# Fuzzy find history
if [[ -n "${terminfo[kcuu1]}" ]]; then
  autoload -U up-line-or-beginning-search
  zle -N up-line-or-beginning-search
  bindkey -M emacs "${terminfo[kcuu1]}" up-line-or-beginning-search
fi
if [[ -n "${terminfo[kcud1]}" ]]; then
  autoload -U down-line-or-beginning-search
  zle -N down-line-or-beginning-search
  bindkey -M emacs "${terminfo[kcud1]}" down-line-or-beginning-search
fi

# Navigation keys
if [[ -n "${terminfo[khome]}" ]]; then
  bindkey -M emacs "${terminfo[khome]}" beginning-of-line
fi
if [[ -n "${terminfo[kend]}" ]]; then
  bindkey -M emacs "${terminfo[kend]}" end-of-line
fi

# Completion menu navigation
if [[ -n "${terminfo[kcbt]}" ]]; then
  bindkey -M emacs "${terminfo[kcbt]}" reverse-menu-complete
fi

# Deletion keys
bindkey -M emacs '^?' backward-delete-char
if [[ -n "${terminfo[kdch1]}" ]]; then
  bindkey -M emacs "${terminfo[kdch1]}" delete-char
else
  bindkey -M emacs "^[[3~" delete-char
  bindkey -M emacs "^[3;5~" delete-char
fi

# Additional key bindings
bindkey -M emacs '^[[3;5~' kill-word              # [Ctrl-Delete] - delete whole forward-word
bindkey -M emacs '^[[1;5C' forward-word           # [Ctrl-RightArrow] - move forward one word
bindkey -M emacs '^[[1;5D' backward-word          # [Ctrl-LeftArrow] - move backward one word

# Miscellaneous key bindings
bindkey '\ew' kill-region                         # [Esc-w] - Kill from the cursor to the mark
bindkey -s '\el' 'ls\n'                           # [Esc-l] - run command: ls
bindkey '^r' history-incremental-search-backward  # [Ctrl-r] - Search backward incrementally
bindkey ' ' magic-space                           # [Space] - don't do history expansion

# Edit the current command line in $EDITOR
autoload -U edit-command-line
zle -N edit-command-line
bindkey '\C-x\C-e' edit-command-line

# File rename magic
bindkey "^[m" copy-prev-shell-word
# history search
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
