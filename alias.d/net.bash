##
## Network
##

alias ping='ping -c 5'
have wget && alias wget='wget -c'

# list open ports
alias ports='sudo lsof -i -n -P'

# list running local servers
alias opennet='sudo lsof -i'

# Websites
alias google="firefox -P Browsing http://www.google.com"
alias wiki="firefox -P Browsing http://en.wikipedia.org/wiki/Main_Page"

# Get public IP address
myip () { 
    wget -q -O - checkip.dyndns.org | \
    sed -e 's/.*Current IP Address: //' -e 's/<.*$//'; 
}

mylocalip() {
    ip -o addr show wlp3s0 | \
    head -n 1 | \
    sed 's/.*inet \(\S*\)\/.*/\1/g'
}
