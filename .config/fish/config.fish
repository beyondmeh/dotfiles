
if status is-interactive
  # Commands to run in interactive sessions can go here

  # Set env variables
  set -a PATH ~/bin

  if type -q neovim
    set -x EDITOR neovim
  else if type -q nvim
    set -x EDITOR nvim
  else if type -q micro
    set -x EDITOR micro
  else
    set -x EDITOR vi
  end

  set -x PAGER less
  if type -q most
    set -x PAGER most
  end

  # functions
  function ..    ; cd .. ; end
  function ...   ; cd ../.. ; end
  function ....  ; cd ../../..; end
  function ..... ; cd ../../../.. ; end

  function grep ; command grep --color=auto $argv ; end

  function !!
    if type -q sudo
      eval sudo $history[1]
    else if type -q doas
      eval doas $history[1]
    else
      su -c $history[1] root
    end
  end

  # Prefered programs
  alias nano "micro"
  alias ls "exa"
  alias dd "dc3dd"
  alias du "ncdu" 
  alias ping "gping"
  alias cat "bat"
  alias top "btop"
  alias diff "colordiff"
  alias wget "curl -O"

  # new aliases
  alias s "sudo"
  alias sl "ls"
  alias md "mkdir -p"
  alias rd "rmdir"
  alias mv "mv -i"
  alias cp "cp -i"
  
  alias ip "dig +short myip.opendns.com @resolver1.opendns.com"
  alias dig "dig +nocmd any +multiline +noall +answer"

  alias rmdstore "find . -name '*.DS_Store' -type f -ls -delete"

  # print motd-like
  figlet -f mini $(hostname)
 
  if type -q fortune
    tput setaf 5
    fortune -s
    tput sgr0
  end      
  
end

test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish
