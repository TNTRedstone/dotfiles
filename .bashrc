#!/bin/bash
iatest=$(expr index "$-" i)

#######################################################
# SOURCED ALIAS'S AND SCRIPTS BY zachbrowne.me
#######################################################

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Enable bash programmable completion features in interactive shells
if [ -f /usr/share/bash-completion/bash_completion ]; then
	. /usr/share/bash-completion/bash_completion
elif [ -f /etc/bash_completion ]; then
	. /etc/bash_completion
fi

#######################################################
# EXPORTS
#######################################################

# Disable the bell
if [[ $iatest -gt 0 ]]; then bind "set bell-style visible"; fi

# Expand the history size
export HISTFILESIZE=10000
export HISTSIZE=500

export NIXPKGS_ALLOW_UNFREE=1
export XDG_DATA_DIRS=/usr/share/:/usr/local/share/:/var/lib/snapd/desktop
# Don't put duplicate lines in the history and do not add lines that start with a space
export HISTCONTROL=erasedups:ignoredups:ignorespace

# Check the window size after each command and, if necessary, update the values of LINES and COLUMNS
shopt -s checkwinsize

# Causes bash to append to history instead of overwriting it so if you start a new terminal, you have old session history
shopt -s histappend
PROMPT_COMMAND='history -a'

# Allow ctrl-S for history navigation (with ctrl-R)
[[ $- == *i* ]] && stty -ixon

# Ignore case on auto-completion
# Note: bind used instead of sticking these in .inputrc
if [[ $iatest -gt 0 ]]; then bind "set completion-ignore-case on"; fi

# Show auto-completion list automatically, without double tab
if [[ $iatest -gt 0 ]]; then bind "set show-all-if-ambiguous On"; fi

# Set the default editor
export EDITOR='nvim'
export VISUAL='nvim'
alias vim='nvim'
alias cat='bat'
alias reb='sudo dnf update -y; nix-env -u; reboot;'
alias shdn='sudo dnf update -y; nix-env -u; shutdown now || systemctl poweroff -i'
alias ydnf='sudo dnf -y install'
alias dupdate='sudo dnf -y update'
alias neofetch='fastfetch'
alias fmcli='clifm'

# To have colors for ls and all grep commands such as grep, egrep and zgrep
export CLICOLOR=1
export LS_COLORS='no=00:fi=00:di=00;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:*.xml=00;31:'
#export GREP_OPTIONS='--color=auto' #deprecated
alias grep="/usr/bin/grep $GREP_OPTIONS"
unset GREP_OPTIONS

# Color for manpages in less makes manpages a little easier to read
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

#######################################################
# GENERAL ALIAS'S
#######################################################
# To temporarily bypass an alias, we precede the command with a \
# EG: the ls command is aliased, but to use the normal ls command you would type \ls

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# alias to show the date
alias da='date "+%Y-%m-%d %A %T %Z"'

# Alias's to modified commands
alias cp='cp -i'
alias mv='mv -i'
alias mkdir='mkdir -p'
alias ps='ps auxf'
alias ping='ping -c 10'
alias less='less -R'
alias cls='clear'
alias vi='nvim'
alias svi='sudo nvim'

# Change directory aliases
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

alias ls='ls -aFh --color=always' # add colors and file type extensions

# Search command line history
alias h="history | grep "

# To see if a command is aliased, a file, or a built-in command
alias checkcommand="type -t"

alias clr='clear'

#######################################################
# SPECIAL FUNCTIONS
#######################################################

extract() {
	for archive in "$@"; do
		if [ -f "$archive" ]; then
			case $archive in
			*.tar.bz2) tar xvjf $archive ;;
			*.tar.gz) tar xvzf $archive ;;
			*.bz2) bunzip2 $archive ;;
			*.rar) rar x $archive ;;
			*.gz) gunzip $archive ;;
			*.tar) tar xvf $archive ;;
			*.tbz2) tar xvjf $archive ;;
			*.tgz) tar xvzf $archive ;;
			*.zip) unzip $archive ;;
			*.Z) uncompress $archive ;;
			*.7z) 7z x $archive ;;
			*) echo "don't know how to extract '$archive'..." ;;
			esac
		else
			echo "'$archive' is not a valid file!"
		fi
	done
}

# Create and go to the directory
mkcd() {
	mkdir -p "$1"
	cd "$1"
}

# IP address lookup
alias whatismyip="whatsmyip"
function whatsmyip() {
	# Dumps a list of all IP addresses for every device
	# /sbin/ifconfig |grep -B1 "inet addr" |awk '{ if ( $1 == "inet" ) { print $2 } else if ( $2 == "Link" ) { printf "%s:" ,$1 } }' |awk -F: '{ print $1 ": " $3 }';

	### Old commands
	# Internal IP Lookup
	#echo -n "Internal IP: " ; /sbin/ifconfig eth0 | grep "inet addr" | awk -F: '{print $2}' | awk '{print $1}'
	#
	#	# External IP Lookup
	#echo -n "External IP: " ; wget http://smart-ip.net/myip -O - -q

	# Internal IP Lookup.
	if [ -e /sbin/ip ]; then
		echo -n "Internal IP: "
		/sbin/ip addr show wlan0 | grep "inet " | awk -F: '{print $1}' | awk '{print $2}'
	else
		echo -n "Internal IP: "
		/sbin/ifconfig wlan0 | grep "inet " | awk -F: '{print $1} |' | awk '{print $2}'
	fi

	# External IP Lookup
	echo -n "External IP: "
	curl -s ifconfig.me
}

_z_cd() {
	cd "$@" || return "$?"

	if [ "$_ZO_ECHO" = "1" ]; then
		echo "$PWD"
	fi
}

z() {
	if [ "$#" -eq 0 ]; then
		_z_cd ~
	elif [ "$#" -eq 1 ] && [ "$1" = '-' ]; then
		if [ -n "$OLDPWD" ]; then
			_z_cd "$OLDPWD"
		else
			echo 'zoxide: $OLDPWD is not set'
			return 1
		fi
	else
		_zoxide_result="$(zoxide query -- "$@")" && _z_cd "$_zoxide_result"
	fi
}

_zoxide_hook() {
	if [ -z "${_ZO_PWD}" ]; then
		_ZO_PWD="${PWD}"
	elif [ "${_ZO_PWD}" != "${PWD}" ]; then
		_ZO_PWD="${PWD}"
		zoxide add "$(pwd -L)"
	fi
}

case "$PROMPT_COMMAND" in
*_zoxide_hook*) ;;
*) PROMPT_COMMAND="_zoxide_hook${PROMPT_COMMAND:+;${PROMPT_COMMAND}}" ;;
esac
#######################################################
# Set the ultimate amazing command prompt
#######################################################

export WLR_NO_HARDWARE_CURSORS=1

export PATH=$PATH:"$HOME/.local/bin:$HOME/.cargo/bin:/var/lib/flatpak/exports/bin:/.local/share/flatpak/exports/bin:"
export PATH="$PATH:~/Downloads/flutter/bin"

fastfetch
eval "$(starship init bash)"

#Autojump

if [ -f "/usr/share/autojump/autojump.sh" ]; then
	. /usr/share/autojump/autojump.sh
elif [ -f "/usr/share/autojump/autojump.bash" ]; then
	. /usr/share/autojump/autojump.bash
else
	echo "can't found the autojump script"
fi

source ~/.local/share/blesh/ble.sh
