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

bso() {
	local username="dhwang@us.ibm.com"
	local password=$(lpass show --password "w3.ibm.com")
	eval $HOME/.ibm/bso.exp "$1" $username $(printf '%q' $password)
}
alias bso=bso

