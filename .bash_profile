export PATH=/usr/local/bin:$PATH

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

if [[ "$HOSTNAME" == "vader" ]]; then
        export PS1="(｡▼皿▼): \W$ "
fi

export HISTCONTROL=ignorespace

OS=$(([[ -f /etc/lsb-release ]] && grep -q -i "Ubuntu" /etc/lsb-release) \
	&& echo "ubuntu" || echo "os x")

if [[ "$OS" == "ubuntu" ]]; then
	export EDITOR="vim"
elif [[ "$OS" == "os x" ]]; then
	export EDITOR="mvim -f"
fi

export GOPATH=$HOME/code/go
export PATH=$PATH:$GOPATH/bin

export NVM_DIR=$HOME/.nvm
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
command -v brew >/dev/null 2>&1 &&\
	[ -d "$(brew --prefix nvm)" ] && . "$(brew --prefix nvm)/nvm.sh"

command -v rbenv >/dev/null 2>&1 &&\
        eval "$(rbenv init -)"

lpasscp() {
	lpass show --clip --password "$1"
}
alias lpasscp=lpasscp
