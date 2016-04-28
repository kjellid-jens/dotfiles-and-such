# custom prompt
PS1="\[\e[32m\] \@\[\e[m\]\[\e[34m\][\\u@ThinkPadT400]\[\e[m\]\[\e[33m\] \w \[\e[m\]$ "

# set vi editing mode
set -o vi

alias .w='cd ~/workspace'
alias .h='cd ~'
alias ..="cd .."

alias .install="sudo apt-get install"
alias .update="sudo apt-get update"

alias py="python"

export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
