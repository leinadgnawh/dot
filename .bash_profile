export PATH=/usr/local/bin:$PATH

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

export HISTCONTROL=ignorespace

export P4CONFIG=~/.p4config

export GOPATH=$HOME/code/go

export NVM_DIR=$HOME/.nvm
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
[ -d "$(brew --prefix nvm)" ] && . "$(brew --prefix nvm)/nvm.sh"

lpasscp() {
	lpass show --clip --password "$1"
}
alias lpasscp=lpasscp

_expect() {
	local run="$1"
	local host="$2"
	local username="$3"
	local password="$4"
	eval $run $host $username $password
}

bso() {
	local ibm="w3.ibm.com"
	local username=$(lpass show --username $ibm)
	local password=$(lpass show --password $ibm)
	_expect $HOME/.ibm/bso.exp "$1" $username $(printf '%q' $password)
}
alias bso=bso

vpn() {
	local ibm="asavpn.pok.ibm.com"
	local username=$(lpass show --username $ibm)
	local password=$(lpass show --password $ibm)
	_expect $HOME/.ibm/vpn.exp $ibm $username $(printf '%q' $password)
}
alias vpn=vpn

alias vpnq="/opt/cisco/anyconnect/bin/vpn -s disconnect"

