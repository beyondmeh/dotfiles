if status is-interactive
  # Commands to run in interactive sessions can go here

  if type -q fortune
    tput setaf 5
    fortune -s
    tput sgr0
  end      
end

test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish

