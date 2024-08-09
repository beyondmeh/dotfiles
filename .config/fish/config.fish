set -x -g LC_ALL en_US.UTF-8
set -x -g LANG en_US.UTF-8

if status is-interactive
    # Commands to run in interactive sessions can go here

    # Set env variables
    set -a PATH ~/bin
    set -a PATH ~/.local/bin
    set -a PATH /opt/homebrew/bin
    set -a PATH /usr/local/bin
    set -a PATH ~/Library/Python/3.9/bin

    # theme
    fish_config theme choose "Dracula Official"
    starship init fish | source

    # Set perferred editors and pager 
    if type -q hx
        set -x EDITOR hx
    else if type -q micro
        set -x EDITOR micro
    else
        set -x EDITOR vim
    end

    if type -q most
        set -x PAGER most
    else
        set -x PAGER less
    end

    # Dracula theme support for micro editor
    if type -q micro
        set -x MICRO_TRUECOLOR 1
    end

    # functions
    function ..
        cd ..
    end
    function ...
        cd ../..
    end
    function ....
        cd ../../..
    end
    function .....
        cd ../../../..
    end

    function grep
        command grep --color=auto $argv
    end

    function !!
        if type -q sudo
            eval sudo $history[1]
        else if type -q doas
            eval doas $history[1]
        else
            su -c $history[1] root
        end
    end

    function md --wraps mkdir -d "Create a directory and cd into it"
        command mkdir -p $argv
        if test $status = 0
            switch $argv[(count $argv)]
                case '-*'
                case '*'
                    cd $argv[(count $argv)]
                    return
            end
        end
    end

    if type -q exa
        alias ls exa
    else if type -q exz
        alias ls eza
    end

    # Prefered programs
    alias dd dc3dd
    alias du ncdu
    alias ping gping
    alias cat bat
    alias top btop
    alias diff colordiff
    alias wget "curl -O"
    alias vi $EDITOR
    alias vim $EDITOR
    alias nano $EDITOR
    alias e $EDITOR
    alias se "sudo $EDITOR"
            
    # new aliases
    alias s sudo
    alias sl ls
    alias rd rmdir
    alias mv "mv -i"
    alias cp "cp -i"

    alias ipv4 "dig -4 +short myip.opendns.com @resolver1.opendns.com"
    alias ipv6 "dig -6 +short myip.opendns.com @resolver1.opendns.com"
    alias ip "ipv4 && ipv6"
    alias dig "dig +nocmd any +multiline +noall +answer"

    alias rmdstore "find . -name '*.DS_Store' -type f -ls -delete"

    # print motd-like
    #figlet -f mini $(hostname)

    if type -q fortune
        tput setaf 5
        fortune -s
        tput sgr0
    end

end

test fzf; and fzf --fish | source

test -e {$HOME}/.iterm2_shell_integration.fish; and source {$HOME}/.iterm2_shell_integration.fish
