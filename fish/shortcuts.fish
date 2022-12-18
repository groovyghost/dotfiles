abbr fishconf "$EDITOR ~/.config/fish/"
abbr vimconf "$EDITOR ~/.config/nvim/"
abbr termconf "$EDITOR ~/.config/alacritty/"
abbr mkdir 'mkdir -p'
abbr wrk 'cd /home/user/Public/Work'
abbr psl ' cd /home/user/Public/Personal'
abbr reading 'python3 /home/user/Public/Personal/read/source/main.py && notify-send "Done" '
abbr fvpn 'sudo openfortivpn'
abbr rsync 'rsync -avzhP'
abbr fcd 'cd (find * -type d | fzf)'
abbr pip_upgrade_all 'pip3 list --outdated --format=freeze | grep -v '^\-e' | cut -d = -f 1 | xargs -n1 pip3 install -U'
