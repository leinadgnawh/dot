export PATH=/usr/local/bin:$PATH

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

export P4CONFIG=~/.p4config

export GOPATH=$HOME/code/go

export NVM_DIR=$HOME/.nvm
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

lpasscp() {
	lpass show --clip --password $1
}
alias lpasscp=lpasscp

