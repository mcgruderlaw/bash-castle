#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc


PATH=$PATH:/usr/sbin:/usr/local/bin:~/.vim:~/.w3m

export PATH
export PATH="${PATH}:$HOME/.bin:$HOME/.local/bin"
export PATH="${PATH}:/usr/share/surfraw"
export PATH="${PATH}:$HOME/.config/surfraw/elvi"
export PATH="${PATH}:/var/tmp/portage/dev-util/cbindgen-0.18.0/image/usr/bin"
export LANG=en_US.UTF-8
#export TERM=xterm-256color
#export TERM=rxvt-256color
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
export GPG_TTY=$(tty)
#export PATH="/usr/lib/ccache/bin${PATH:+:}$PATH"
#export CCACHE_DIR="/var/cache/ccache"
export PATH="${PATH}:/opt/bin"
export TMPDIR="/tmp"
if [[ -n "$SSH_CONNECTION" ]] ;then
    export PINENTRY_USER_DATA="USE_CURSES=1"
fi

unset PROMPT_COMMAND

# combine mkdir and cd
mkcd () {
  mkdir "$1"
  cd "$1"
}

#keychain ~/.ssh/id_rsa
#. ~/.keychain/$HOSTNAME-sh
#. ~/.keychain/$HOSTNAME-sh-gpg

[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec ssh-agent startx
