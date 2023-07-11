
show_prompt() {
	export PROMPT="$(zsh_remote_host) %{%B%}%2~%{%b%} $(zsh_usr_symbol) "
}
# ~/.bashrc

# don't run if the shell not interactive
[ -z "$PS1" ] && return


source $HOME/.config/bash/dotfiles-autoupdate.sh
source $HOME/.config/bash/alias.sh
source $HOME/.config/bash/functions.sh
source $HOME/.config/bash/find-missing-cmds.sh
source $HOME/.config/bash/git-prompt.sh

__remote_host() {
    if [ "$SSH_CONNECTION" ]; then
	echo -n "$(whoami)@$(hostname) "
    fi
}


PROMPT_COMMAND=__prompt_command

__prompt_command() {
	PROMPT_DIRTRIM=3
	PS1="$(__git_ps1) \[$(tput setaf 3)\]$(__remote_host)\[$(tput setaf 4; tput bold)\]\w"

	if [ $(id -u) == "0" ]; then
		PS1="$PS1 \[$(tput setaf 1)\]#"
	else
		PS1="$PS1 \[$(tput setaf 7)\]$"
	fi

	PS1="$PS1\[$(tput sgr0)\] "
}

if uname -a | grep Darwin > /dev/null; then
  eval $(/opt/homebrew/bin/brew shellenv)
  export BASH_SILENCE_DEPRECATION_WARNING=1
fi

show_fortune

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
