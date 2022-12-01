#!/bin/bash

curl -s https://api.github.com/repos/ogham/exa/releases/latest | \
grep "browser_download_url.*linux-x86_64*" | \
cut -d : -f 2,3 | \
tr -d \" | \
tail -n1 | \
wget -i -

curl -s https://api.github.com/repos/derailed/k9s/releases/latest | \
grep -i "browser_download_url.*linux" | \
cut -d : -f 2,3 | \
tr -d \" | \
tail -n1 | \
wget -i -

curl -s https://api.github.com/repos/tree-sitter/tree-sitter/releases/latest | \
grep -i "browser_download_url.*linux" | \
cut -d : -f 2,3 | \
tr -d \" | \
tail -n1 | \
wget -i -


curl -s https://api.github.com/repos/koalaman/shellcheck/releases/latest | \
grep -i "browser_download_url.*linux" | \
cut -d : -f 2,3 | \
tr -d \" | \
tail -n1 | \
wget -i -

curl -s https://api.github.com/repos/gcla/termshark/releases/latest | \
grep -i "browser_download_url.*linux" | \
cut -d : -f 2,3 | \
tr -d \" | \
tail -n1 | \
wget -i -

wget https://go.dev/dl/go1.19.3.linux-amd64.tar.gz && \
tar -xf go1.19.3.linux-amd64.tar.gz --directory="$HOME/Public/Personal/"
