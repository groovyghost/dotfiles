# Aliases for enhanced ls and tmux
if [[ -n "$(command -v eza)" ]]; then
    alias ls='eza --icons --git'
    alias ll='eza -l --icons -a --git'
fi

alias tmx='tmux -u attach || tmux -u'

# Short aliases for directory traversal
alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'
alias -g ......='../../../../..'

# Alias for connecting to VPN using openfortivpn
alias fvpn='sudo openfortivpn --persistent=2'

# Alias for quick navigation
alias -- -='cd -'

# Set AWS profile using fzf and list profiles from AWS credentials file
alias awsp='export AWS_PROFILE=$(sed -n "s/^\[\(.*\)\]$/\1/p" ~/.aws/credentials | fzf -i --height=20% --reverse --border) && echo "$AWS_PROFILE is set"'

# Alias and function for history search
alias histgrep='echo "[Tip] Use !number to execute the command" && history -i -100 | grep' # -i for the timestamp

# Function to create a gzipped tar archive
function tarup() { tar -czvf ${1}.tar.gz $1 }

# Function to extract a gzipped tar archive
function untar() { tar -zxvf $1 }

# Function to make a directory and change into it
function mkcd() { mkdir -p $1; cd $1 }

# Function to SSH into a host from SSH config using fzf
function sshf() {
  [[ ! -e ~/.ssh/config ]] && echo 'There is no SSH config file!' && return
  hostnames=$(awk ' $1 == "Host" { print $2 } ' ~/.ssh/config )
  [[ -z "${hostnames}" ]] && echo 'There are no host parameters in SSH config file' && return
  selected=$(printf "%s\n" "${hostnames[@]}" | fzf \
    --reverse --border=rounded --cycle --height=30% \
    --header='Pick a host')
  [[ -z "${selected}" ]] && echo 'Nothing was selected :(' && return
  echo "SSH to ${selected}..." && ssh "$selected"
}

# Function to change directory using fzf
function cdf() {
  selected=$(find * -maxdepth 1 -type d 2>/dev/null | fzf \
    --reverse --border=rounded --cycle --height=50% \
    --header='Pick a directory to navigate to')
  [[ -z $selected ]] && echo 'Nothing was selected :(' || cd "$selected"
}

# Override pip to warn if not in a virtual environment
# function pip(){
#   if [[ -z "$VIRTUAL_ENV" ]]; then
#     printf "\033[1;33m Not in VENV\033[0m \n" && return 2
#   else
#     pip3 "$@"
#   fi
# }

# Function to toggle virtual environment
function ve() {
    if [[ -n "$VIRTUAL_ENV" ]]; then
        deactivate
    else
        local venv_name="${1:-.venv}"
        local venv_path="$PWD/$venv_name"
        if [[ -d "$venv_path" ]]; then
            source "$venv_path/bin/activate"
            return
        fi
        print "\033[1;33mNo virtual environment found with the name '$venv_name'.\033[0m"
    fi
}
