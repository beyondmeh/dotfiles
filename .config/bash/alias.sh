# helper function to see if programs are installed
have() { command -v $@ >/dev/null 2>&1 ; }

################################################################################
# default flags to built-in programs
##

alias dir='dir --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias ps='ps -auxf'
alias du='du -h'
alias dd='sudo dd status=progress'
alias mkdir='mkdir -pv'
alias ping='ping -c 5'
alias free='free -ht'
alias dig='dig +nocmd any +multiline +noall +answer'
alias wget='wget -c'
alias curl='curl -L -O'

# safer commands
alias rm="rm -Iv"
alias cp="cp -iv"
alias mv="mv -iv"

have shred && alias shred='shred -fuzvn 1'

################################################################################
# if available, replace coreutils with more feature rich programs
##

have htop && alias top='htop'
have btop && alias top='btop'
have pydf && alias df='pydf'
have dfrs && alias df='dfrs'
have ncdu && alias du='ncdu'
have gpg2 && alias gpg='gpg2'
have nvim && alias nano='nvim'
have colordiff && alias diff='colordiff'
have pygmentize && alias cat='pygmentize -O style=monokai -f console256 -g '
have batcat && alias cat='batcat'
have bcat && alias cat='bcat'
have nala && alias apt='nala'

################################################################################
# aliases for Linux programs to point to the FreeBSD alternate command
##
if uname | grep -q FreeBSD; then
	alias dig="drill"
fi

################################################################################
# ls
##

if ls --version 2>/dev/null | grep -q GNU; then
	# GNU coreutils only
	alias ls='ls --color --group-directories-first -Fh'
else
	# BSD like
	alias ls='ls -AFhG'
fi

# steam trains are nice, but this suits me better
have lolcat && alias sl='ls $@ | lolcat' || function sl() {
	# settle for a Monty Python insult if we don't have lolcat
	tput setaf 5
	echo "  You empty headed animal food trough wiper"
	echo "  I fart in your general direction"
	echo "  Your mother was a hamster and your father smelt of elderberries"
	echo
	tput bold
	sleep 1 && /bin/ls -Fhx "$@"
	tput sgr0
	tput setaf 5
	echo
	echo "  Now go away or I shall taunt you a second time!"
}

################################################################################
# new commands
##

# find problematic #!/bin/bash compared to the better #!/usr/bin/env bash
alias shebangbad="find . -type f -exec grep -l '#!/bin/bash' {} \;"

# navigation
alias ~='cd $HOME && clear'
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

alias yd="youtube-dl"
alias timestamp='date +%s'
alias update-grub='sudo grub-mkconfig -o /boot/grub/grub.cfg'
alias copy='rsync -WaPh ' # cp with progress indicator
alias psg='ps aux | grep -v grep | grep -i -e VSZ -e' # like pgrep, but better
alias dirsize="pwd && du -h . 2>/dev/null | tail -1 | awk '{print $1}'"
alias biggest='find . -type f -exec du -a {} + | sort -n -r | awk '\''{$1=""}1'\'' | head -25'
alias duless='du -ach 2>/dev/null | sort -h | less'
alias wifi-scan='nmcli dev wifi list'
alias fs='du -h | tail -1'

# git
alias git-loc="git ls-files | xargs wc -l | tail -1 | sed 's/total/lines of code/g'"
alias git-undopush='git push -f origin HEAD^:master'
alias git-undocommit='git reset --soft HEAD~1'

# permissions
alias chrw='chmod ug+rw'
alias chx='chmod +x'
alias mine='sudo chown ${USER}:${USER}'

# networking
alias openports='sudo lsof -i -n -P' # list open ports / running network services
alias whatismyip='dig +short myip.opendns.com @resolver1.opendns.com'
alias whois='echo $1 | nc whois.internic.net 43 | sed '/NOTICE:/q' | head -n -4 -'
alias downthemall='youtube-dl -a download.txt'

# sudo
alias fuck='sudo $(history -p !!)' # some people are nice and call this "please"
alias sedit='sudo nvim'
alias halt='sudo halt'
alias reboot='sudo reboot'

# services
alias start='sudo systemctl start '
alias stop='sudo systemctl stop '
alias restart='sudo systemctl restart '
alias status='systemctl status '
alias syslog='journalctl -u '

# ciphers
alias rot13="tr 'A-Za-z' 'N-ZA-Mn-za-m'"
alias cipher="tac | rev | tr 'A-Za-z' 'N-ZA-Mn-za-m'"

################################################################################
# simplify command that are versioned
##

have jekyll.ruby2.7 && alias jekyll='jekyll.ruby2.7'
