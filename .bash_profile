export PATH=/usr/local/bin:$PATH

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

export CODE=$HOME/code
if [[ -d $CODE/git/git ]]; then
        . $CODE/git/git/contrib/completion/git-completion.bash
        . $CODE/git/git/contrib/completion/git-prompt.sh

        export GIT_PS1_SHOWDIRTYSTATE=true
        export GIT_PS1_SHOWUNTRACKEDFILES=true
        export GIT_PS1_SHOWCOLORHINTS=true
        GIT_PS1='\[\e[0;31m\]$(__git_ps1)\[\e[0m\]'
fi

if [[ "$HOSTNAME" == "vader" ]]; then
        export PS1='(｡▼皿▼): \[\e[1m\]\W\[\e[0m\]'$GIT_PS1'\$ '
fi

export HISTCONTROL=ignorespace

OS=$(([[ -f /etc/lsb-release ]] && grep -q -i "Ubuntu" /etc/lsb-release) \
	&& echo "ubuntu" || echo "os x")

if [[ "$OS" == "ubuntu" ]]; then
	export EDITOR="vim"
elif [[ "$OS" == "os x" ]]; then
	export EDITOR="mvim -f"
fi

export GOPATH=$CODE/go
export PATH=$PATH:$GOPATH/bin

export NVM_DIR=$HOME/.nvm
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
command -v brew >/dev/null 2>&1 &&\
	[ -d "$(brew --prefix nvm)" ] && . "$(brew --prefix nvm)/nvm.sh"

command -v rbenv >/dev/null 2>&1 &&\
        eval "$(rbenv init -)"

if [ -f ~/.gnupg/.gpg-agent-info ] && [ -n "$(pgrep gpg-agent)" ]; then
    source ~/.gnupg/.gpg-agent-info
    export GPG_AGENT_INFO
else
    eval $(gpg-agent --daemon --write-env-file ~/.gnupg/.gpg-agent-info)
fi

lpasscp() {
	lpass show --clip --password "$1"
}
alias lpasscp=lpasscp
