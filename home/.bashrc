#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
[[ -z $XDG_CONFIG_HOME ]] && export XDG_CONFIG_HOME="$HOME/.config"

#if [[ \$TMUX ]]; then source ~/.tmux-git/tmux-git.sh; fi

#export IFS=$' \t\n'
export EDITOR="vim --servername VIMSERVER --remote-silent"
export MANWIDTH=80
export BROWSER="qt.sh"
export BROWSERCLI="w3m"
export PLAYER="mpv"
export IMAGEVIEWER="feh"
export HISTIGNORE="clear:history"
export HISTCONTROL="ignoredups"
# export PAGER=/usr/local/bin/vimpager
export LPASS_AGENT_TIMEOUT=0
export PAGER="less"
export CDPATH=$CDPATH:~/Downloads:~/Dropbox:~/Documents
export PYTHONPATH=$PYTHONPATH:~/usr/lib/python3.4/site-packages:~/usr/lib/python2.7/site-packages
export GIT_AUTHOR_NAME="David E. McGruder"
export GIT_COMMITTER_NAME="David E. McGruder"
export TERMCMD="urxvt"
PS1='[\u@\h \W]\$ '
complete -cf sudo
complete -cf man
[ -n "$XTERM_VERSION" ] # && transset-df --id "$WINDOWID" >/dev/null OR transset-df -a >/dev/null

#alsi archey3

# If you work with git, you've probably had that nagging sensation of not knowing what branch you are on. Worry no longer!

#export PS1="\\w:\$(git branch 2>/dev/null | grep '^*' | colrm 1 2)\$ "
#export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\] \[\033[33;1m\]\w\[\033[m\] (\$(git branch 2>/dev/null | grep '^*' | colrm 1 2)) \$ "

#export PS1='$([ -n "$TMUX" ] && tmux setenv TMUXPWD_$(tmux display -p "#D" | tr -d %) "$PWD")'$base_color' '$stripe_one_col'⮀'$stripe_two_col'⮀'$end_stripe_col'⮀\[[0m\]'

# This will change your prompt to display not only your working directory but also your current git branch, if you have one. Pretty nifty!

# ~/code/web:beta_directory$ git checkout master
# Switched to branch "master"
# ~/code/web:master$ git checkout beta_directory
# Switched to branch "beta_directory"
# ~/code/web:beta_directory$ 

# gitprompt configuration

# Set config variables first
#GIT_PROMPT_ONLY_IN_REPO=1

# as last entry source the gitprompt script
# source ~/bash-git-prompt/gitprompt.sh

# the ultimate git ps1 bash prompt
#source /usr/share/git/completion/git-prompt.sh
source /usr/share/git/git-prompt.sh
source ~/.bash_aliases


#Homeshick
source "$HOME/.homesick/repos/homeshick/homeshick.sh"

source "$HOME/.homesick/repos/homeshick/completions/homeshick-completion.bash"

source "$HOME/.git-completion.bash"


homeshick --quiet refresh

#powerline-daemon -q

#.  ~/.vim/bundle/powerline/powerline/bindings/bash/powerline.sh

# Set vim modes in bash, bind -P for available bindings
set -o vi

# change directories without cd
shopt -s autocd


# export PAGER="/bin/sh -c \"unset PAGER;col -b -x | \
    # vim -R -c 'set ft=man nomod nolist' -c 'map q :q<CR>' \
    # -c 'map <SPACE> <C-D>' -c 'map b <C-U>' \
    # -c 'nmap K :Man <C-R>=expand(\\\"<cword>\\\")<CR><CR>' -\""

# Functions 

#Automatically enter ssh passphrase; SSH Keys Arch Wiki
if ! pgrep -u $USER ssh-agent > /dev/null; then
    ssh-agent > ~/.ssh-agent-thing
fi
if [[ "$SSH_AGENT_PID" == "" ]]; then
    eval $(<~/.ssh-agent-thing)
fi
ssh-add -l >/dev/null || alias ssh='ssh-add -l >/dev/null || ssh-add && unalias ssh; ssh'
#
#today1() {
#        echo -n "Today's date is: "
#        date +"%A, %B %-d, %Y"
#}


# combine mkdir and cd
mkcd () {
  mkdir "$1"
  cd "$1"
}

# make backup file
bak() {
  \cp "$1" "$1.`date -I'seconds'`"
}

# git commit
gitc() {
  git commit -m "$1"
}

recent() {
find $HOME/Documents/ -type f -regex ".*\.\(tex\|md\|txt\)" -mtime -$1 -not -path "*documents*" -exec vim "{}" +
}

gong() {
    at "$1" today << EOF
notify-send --expire-time=300000 "Time to go"
mpc -q toggle
mplayer -loop 10 /usr/lib/libreoffice/share/gallery/sounds/gong.wav
EOF
}

hclone() {
		$HOME/.homesick/repos/homeshick/bin/homeshick clone mcgruderlaw/$1
}

bclone() {
		git clone git@bitbucket.org:sololittle/$1
}

xcompmgr_restart() {
  killall xcompmgr
  sleep 1
  xcompmgr -r7 -o 0.25 -l-10 -t-8 -D7 &
}

w3c() {
		w3m -cookie -num $1
}


tra() {
		transmission-remote -a $1
}


tri() {
		transmission-remote -t$1 -i
}

trs() {
		transmission-remote -t$1 -s
}


trS() {
		transmission-remote -t$1 -S
}


ytstream() {
		mplayer -cookies -cookies-file /tmp/cookie.txt $(youtube-dl -f best -g --cookies /tmp/cookie.txt "$1")
}


yt2mp3() {
		youtube-dl -c --restrict-filenames --extract-audio --audio-format mp3 -o "%(title)s.%(ext)s" $@
}


tara() {
		feh --image-bg black --scale-down ~/Downloads/tara
}

leah() {
		feh --image-bg black --scale-down ~/Downloads/leah
}

# Prevent Wine from adding menu entries and desktop links.
export WINEDLLOVERRIDES='winemenubuilder.exe=d'

