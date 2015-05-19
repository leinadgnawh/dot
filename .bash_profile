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

