# custom prompt
PS1="\[\e[32m\] \@\[\e[m\]\[\e[34m\][\\u@MacBookPro]\[\e[m\]\[\e[33m\] \w \[\e[m\]$ "

# set vi editing mode
set -o vi

alias w='cd ~/workspace'
alias p='cd ~/workspace/web/from-scratch/web-app'
alias h='cd ~'
alias ..="cd .."
alias install="sudo apt-get install"


export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
