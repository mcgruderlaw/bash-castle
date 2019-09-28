#  Customize BASH PS1 prompt to show current GIT repository and branch.
#  by Mike Stewart - http://MediaDoneRight.com

#  SETUP CONSTANTS
#  Bunch-o-predefined colors.  Makes reading code easier than escape sequences.
#  I don't remember where I found this.  o_O

# Reset
Color_Off="\[\033[0m\]"       # Text Reset

# Regular Colors
Black="\[\033[0;30m\]"        # Black
Red="\[\033[0;31m\]"          # Red
Green="\[\033[0;32m\]"        # Green
Yellow="\[\033[0;33m\]"       # Yellow
Blue="\[\033[0;34m\]"         # Blue
Purple="\[\033[0;35m\]"       # Purple
Cyan="\[\033[0;36m\]"         # Cyan
White="\[\033[0;37m\]"        # White

# Bold
BBlack="\[\033[1;30m\]"       # Black
BRed="\[\033[1;31m\]"         # Red
BGreen="\[\033[1;32m\]"       # Green
BYellow="\[\033[1;33m\]"      # Yellow
BBlue="\[\033[1;34m\]"        # Blue
BPurple="\[\033[1;35m\]"      # Purple
BCyan="\[\033[1;36m\]"        # Cyan
BWhite="\[\033[1;37m\]"       # White

# Underline
UBlack="\[\033[4;30m\]"       # Black
URed="\[\033[4;31m\]"         # Red
UGreen="\[\033[4;32m\]"       # Green
UYellow="\[\033[4;33m\]"      # Yellow
UBlue="\[\033[4;34m\]"        # Blue
UPurple="\[\033[4;35m\]"      # Purple
UCyan="\[\033[4;36m\]"        # Cyan
UWhite="\[\033[4;37m\]"       # White

# Background
On_Black="\[\033[40m\]"       # Black
On_Red="\[\033[41m\]"         # Red
On_Green="\[\033[42m\]"       # Green
On_Yellow="\[\033[43m\]"      # Yellow
On_Blue="\[\033[44m\]"        # Blue
On_Purple="\[\033[45m\]"      # Purple
On_Cyan="\[\033[46m\]"        # Cyan
On_White="\[\033[47m\]"       # White

# High Intensty
IBlack="\[\033[0;90m\]"       # Black
IRed="\[\033[0;91m\]"         # Red
IGreen="\[\033[0;92m\]"       # Green
IYellow="\[\033[0;93m\]"      # Yellow
IBlue="\[\033[0;94m\]"        # Blue
IPurple="\[\033[0;95m\]"      # Purple
ICyan="\[\033[0;96m\]"        # Cyan
IWhite="\[\033[0;97m\]"       # White

# Bold High Intensty
BIBlack="\[\033[1;90m\]"      # Black
BIRed="\[\033[1;91m\]"        # Red
BIGreen="\[\033[1;92m\]"      # Green
BIYellow="\[\033[1;93m\]"     # Yellow
BIBlue="\[\033[1;94m\]"       # Blue
BIPurple="\[\033[1;95m\]"     # Purple
BICyan="\[\033[1;96m\]"       # Cyan
BIWhite="\[\033[1;97m\]"      # White

# High Intensty backgrounds
On_IBlack="\[\033[0;100m\]"   # Black
On_IRed="\[\033[0;101m\]"     # Red
On_IGreen="\[\033[0;102m\]"   # Green
On_IYellow="\[\033[0;103m\]"  # Yellow
On_IBlue="\[\033[0;104m\]"    # Blue
On_IPurple="\[\033[10;95m\]"  # Purple
On_ICyan="\[\033[0;106m\]"    # Cyan
On_IWhite="\[\033[0;107m\]"   # White

# Various variables you might want for your PS1 prompt instead
Time12h="\T"
Time12a="\@"
PathShort="\w"
PathFull="\W"
NewLine="\n"
Jobs="\j"


# This PS1 snippet was adopted from code for MAC/BSD I saw from: http://allancraig.net/index.php?option=com_content&view=article&id=108:ps1-export-command-for-git&catid=45:general&Itemid=96
# I tweaked it to work on UBUNTU 11.04 & 11.10 plus made it mo' better

# export PS1=$White$Time12h$Color_Off'$(git branch &>/dev/null;\

#export PS1='$(git branch &>/dev/null;\
#if [ $? -eq 0 ]; then \
#  echo "$(echo `git status` | grep "nothing to commit" > /dev/null 2>&1; \
#  if [ "$?" -eq "0" ]; then \
#    # @4 - Clean repository - nothing to commit
#    echo "'$Green'"$(__git_ps1 "(%s)"); \
#  else \
#    # @5 - Changes to working tree
#    echo "'$IRed'"$(__git_ps1 "{%s}"); \
#  fi)'$BCyan$PathFull$Color_Off''$Red':'$Color_Off' "; \
#else \
#  # @2 - Prompt when not in GIT repo
#  echo "'$Cyan$PathFull$Color_Off''$Red':'$Color_Off' "; \
#fi)'

export PS1=$Cyan$Time12h$Color_Off" <\u@\h>"'$(git branch &>/dev/null;\
if [ $? -eq 0 ]; then \
  echo "$(echo `git status` | grep "nothing to commit" > /dev/null 2>&1; \
  if [ "$?" -eq "0" ]; then \
    # @4 - Clean repository - nothing to commit
    echo "'$Green'"$(__git_ps1 " (%s)"); \
  else \
    # @5 - Changes to working tree
    echo "'$IRed'"$(__git_ps1 " {%s}"); \
  fi) '$BYellow$PathShort$Color_Off''$Red':'$Color_Off' "; \
else \
  # @2 - Prompt when not in GIT repo
  echo " '$Yellow$PathShort$Color_Off''$Red':'$Color_Off' "; \
fi)'

alias startx='ssh-agent startx'

# Modified Commands

# alias less=$PAGER
alias ...='../..'
alias 92='transset-df -a .92'
alias Agg='mux Agg'
alias am='alsamixer'
alias backup='sudo rsync -aAXv --progress --delete-before --exclude={"/dev/*","/proc/*","/sys/*","/tmp/*","/run/*","/mnt/*","/media/*","/lost+found","/var/lib/mpd/Music/*","/var/lib/transmission/Downloads/*","/home/*"} /* /media/Toshiba2/Backup'
alias Case='mux Case'
alias cases='cd ~/Documents/ofc/Cases'
alias c='clear'
alias cdr='cd $(git rev-parse --show-toplevel)'
alias cp='rsync --archive --human-readable --progress --verbose --whole-file'
alias clivid='sudo mplayer -vo fbpau -vc ffwmv3fbpau -fs -vf scale=800:-3'
alias dir='ls --color=auto'
alias drop='dropbox-cli start'
alias duck='w3c www.duckduckgo.com'
alias f='firefox &'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias fj='firejail --seccomp firefox'
alias gits='git status'
alias glog='git log --oneline --decorate --all --graph'
alias grep='grep --color=auto'
alias homep2p='ssh mcgruderlaw@192.168.1.82'
alias homevbox='ssh mcgruderlaw@192.168.1.71'
alias lbg='xterm -bg white -fg blue &'
alias light='xrdb $HOME/.Xresources.d/urxvt.light'
alias black='xrdb $HOME/.Xresources.d/urxvt_black'
alias dark='xrdb $HOME/.Xresources.d/urxvt'
alias l='ls -lh --color=auto'
alias .l='ls -lah --color=auto'
alias ls='ls --color=auto'
alias lpr='lpass show rocketmatter.net'
alias lpi='lpass show icle.org'
alias lpd='lpass show dropbox.com'
alias lpb='lpass show bitbucket.org'
alias lpg='lpass show github.com'
alias lpaz='lpass show Amazon_New'
alias lpe='lpass show evernote.com'
alias lps='lpass show sado.org'
alias lpsw='lpass show sweetmarias.com'
# alias man='w3mman'
alias mountcd='sudo mount /dev/cdrom /media/cdrom'
alias mountd='sshfs dmc@192.168.2.2:/data/Media /home/dmc/Downloads/tmp/ -p 39966'
alias mountT2='sudo mount -t ntfs-3g /dev/sdc1 /media/Toshiba2'
alias mountT='sudo mount -t ntfs-3g /dev/sdb1 /media/Toshiba'
alias muttl='mutt -F $HOME/.muttrc.light'
alias myreflector='sudo reflector -c US -a 4 -f 5 -p http -p https -p ftp --sort rate --save /etc/pacman.d/mirrorlist' 
alias nethome='sudo netctl start home'
alias network='sudo netctl start work'
alias nb='newsbeuter -I $HOME/Documents/notes/newsbeuter_list && newsbeuter'
alias r='ranger'
alias rb='sudo reboot'
alias sb='source ~/.bashrc'
alias sd='sudo shutdown -P -h now'
alias surfraw='sr -browser=$BROWSER'
alias sr='surfraw -browser=$BROWSERCLI'
alias Swedenstop='sudo systemctl stop pia@Sweden.service'
alias Sweden='sudo systemctl start pia@Sweden'
alias td='transmission-daemon'
alias tl='tmux -2 -f $HOME/.tmux.conf.light'
alias Torontostop='sudo systemctl stop pia@CA_Toronto.service'
alias Toronto='sudo systemctl start pia@CA_Toronto.service'
alias trl='transmission-remote -l'
alias trsi='transmission-remote -si'
alias t='tmux -2'
alias vb='virtualbox &'
alias v='vim --servername VIMSERVER'
alias vdir='vdir --color=auto'
alias vs='vim --servername VIMSERVER --remote-silent'
alias wf='sudo wifi-menu'
alias wxp='weather -l "Pontiac, Michigan" -d 2 | less'
alias wxr='weather -l "Rochester Hills, Michigan" -d 2 | less'
alias x='startx'
alias xcc='xclip -selection clipboard'
alias xcp='xclip -selection clipboard -o'
alias xch='xclip -selection primary -o'
alias xr='xcompmgrrestart.sh'
alias z='z.sh'
alias mountm='sudo sshfs dmc@23.124.50.217:/data/Media/Music /media/Music/ -p 39966'
alias mountS='sudo mount -t cifs //192.168.1.102/Scans /mnt/Scans/ -o username=dmc,password=jowcol'
alias ac='source venv/bin/activate'
alias de='deactivate'

# Equery aliases
alias eqf='equery f'
alias equ='equery u'
alias eqh='equery h'
alias eqa='equery a'
alias eqb='equery b'
alias eql='equery l'
alias eqd='equery d'
alias eqg='equery g'
alias eqc='equery c'
alias eqk='equery k'
alias eqm='equery m'
alias eqy='equery y'
alias eqs='equery s'
alias eqw='equery w'
