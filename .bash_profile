export PATH=/usr/local/bin:$PATH

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

if [ -d "$(brew --prefix git)" ]; then
  . $(brew --prefix git)/etc/bash_completion.d/git-completion.bash
  . $(brew --prefix git)/etc/bash_completion.d/git-prompt.sh

  export GIT_PS1_SHOWDIRTYSTATE=true
  export GIT_PS1_SHOWUNTRACKEDFILES=true
  export GIT_PS1_SHOWCOLORHINTS=true

  GIT_PS1='\[\e[0;31m\]$(__git_ps1)\[\e[0m\]'
fi

[[ "$HOSTNAME" == "vader" ]] &&\
  export PS1='(｡▼皿▼): \[\e[1m\]\W\[\e[0m\]'$GIT_PS1'\$ '

export HISTCONTROL=ignorespace

export EDITOR="mvim -f"

export CODE=$HOME/code

export GOPATH=$CODE/go
export PATH=$PATH:$GOPATH/bin

command -v nodenv >/dev/null 2>&1 && eval "$(nodenv init - --no-rehash bash)"

command -v rbenv >/dev/null 2>&1 && eval "$(rbenv init - --no-rehash bash)"

if [ -f ~/.gnupg/.gpg-agent-info ] && [ -n "$(pgrep gpg-agent)" ]; then
  source ~/.gnupg/.gpg-agent-info
  export GPG_AGENT_INFO
else
  eval "$(gpg-agent --daemon)"
fi

lpasscp() {
  lpass show --clip --password "$1"
}
alias lpasscp=lpasscp

export GPG_TTY=$(tty)
