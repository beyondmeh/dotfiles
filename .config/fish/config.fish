set -x EDITOR neovim
set -x PAGER less
set -a PATH ~/bin


if status is-interactive
  # Commands to run in interactive sessions can go here

  if type -q fortune
    tput setaf 5
    fortune -s
    tput sgr0
  end      

  if type -q exa
    alias ls="exa"
  end

  if type -q ncdu
    alias du="ndcu"
  end

  if type -q gping
    alias ping="gping"
  end

  if type -q bat
    alias cat="bat"
  end

  if type -q btop
    alias top="btop"
  end

  if type -q most
    set -x PAGER most
  end

  alias s "sudo"
  alias sl "ls | lolcat"
  alias md "mkdir -p"
  alias rd "rmdir"
  alias mv "mv -i"
  alias cp "cp -i"

  function rm -d "Avoid frustration"
    command rm $argv
    if test $status -ne 0
      read -l -n1 -p "set_color -o red; echo -n 'force? [yn] '; set_color normal" ans
      string match -qi y -- $ans; or return 1
    end
    command rm -rf $argv
  end

  function whatismyip -d "Show my public ip"
    wget -qO - ipv4.icanhazip.com
  end
end

test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish

