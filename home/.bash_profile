#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc


PATH=$PATH:/usr/sbin:~/.vim:~/.w3m

export PATH
export PATH="${PATH}:$HOME/.bin"
export LANG=en_US.UTF-8
#export TERM=xterm-256color
export TERM=rxvt-256color
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket" 
export CASES="$HOME/ofc/Cases/"
export NOTES="$HOME/notes/"

unset PROMPT_COMMAND

# combine mkdir and cd
mkcd () {
  mkdir "$1"
  cd "$1"
}

keychain ~/.ssh/id_rsa
. ~/.keychain/$HOSTNAME-sh
#. ~/.keychain/$HOSTNAME-sh-gpg

# [[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec ssh-agent startx
