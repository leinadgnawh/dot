export PATH=/usr/local/bin:$PATH

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

export HISTCONTROL=ignorespace

OS=$(([[ -f /etc/lsb-release ]] && grep -q -i "Ubuntu" /etc/lsb-release) \
	&& echo "ubuntu" || echo "os x")

if [[ "$OS" == "ubuntu" ]]; then
	export EDITOR="vim"
elif [[ "$OS" == "os x" ]]; then
	export EDITOR="mvim"
fi

export P4CONFIG=$HOME/.p4config

export GOPATH=$HOME/code/go
export PATH=$PATH:$GOPATH/bin

export NVM_DIR=$HOME/.nvm
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
command -v brew >/dev/null 2>&1 &&\
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

winterfell() {
	local out=""
	if [[ "$OS" == "ubuntu" ]]; then
		if env | grep -q ^TMPDIR=; then
			export TMPDIR=/tmp
		fi
		out=$(mktemp --tmpdir bran.XXXX)
	elif [[ "$OS" == "os x" ]]; then
		out=$(mktemp -t bran)
	fi
	bran build | tee $out; \
		grep --color=none -m $(($(bran workers | wc -l)-2)) "1mBuild" $out
}
alias winterfell=winterfell

