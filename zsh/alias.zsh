if [[ -n "$(command -v exa)" ]]; then
    alias ls='exa --icons --git'
    alias ll='exa -l --icons -a --git'
fi
alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'
alias -g ......='../../../../..'
alias fvpn='sudo openfortivpn --persistent=2'
alias -- -='cd -'
alias awsp='export AWS_PROFILE=$(sed -n "s/^\[\(.*\)\]$/\1/p" ~/.aws/credentials | fzf -i --height=20% --reverse --border) && echo "$AWS_PROFILE is set"'
alias histgrep='echo "[Tip] Use !number to execute the command" && history -i -100 | grep' # -i for the timestamp
# c for archive, z for gzip, v for verbose, f for file
tarup() { tar -czvf ${1}.tar.gz $1 }

# x for extracting, v for verbose, f for file
untar() { tar -zxvf $1 }

mkcd() { mkdir -p $1; cd $1 }

# Using fzf to prompt hosts in ~/.ssh/config
sshf() {
  [[ ! -e ~/.ssh/config ]] && echo 'There are is SSH config file!'
  hostnames=$(awk ' $1 == "Host" { print $2 } ' ~/.ssh/config )
  [[ -z "${hostnames}" ]] && echo 'There are no host param in SSH config file'
  selected=$(printf "%s\n" "${hostnames[@]}" | fzf \
    --reverse --border=rounded --cycle --height=30% \
    --header='pick a host')
  [[ -z "${selected}" ]] && echo 'Nothing was selected :(' && return
  echo "SSH to ${selected}..." && ssh "$selected"
}

cdf() {
  selected=$(find * -maxdepth 1 -type d 2>/dev/null | fzf \
    --reverse --border=rounded --cycle --height=50% \
    --header='Pick a directory to navigate to')
  [[ -z $selected ]] && echo 'Nothing was selected :(' || cd "$selected"
}
