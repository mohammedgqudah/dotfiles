#precmd() {
#	print -rP "%F{blue}[%~]%f"
#}
#PS1='%F{blue}>>%f '
plugins=(git)

# aliases
#
alias zshconfig="nvim ~/.config/dotfiles/.zshrc"
alias :q="exit"
alias k="kubectl"
alias kgp="k get pods"
alias kgd="k get deploy"
alias kgsvc="k get svc"
alias kdesc="k describe"
alias :tabnew="open -a ITerm ."
alias kn="kubectl config set-context --current --namespace"
alias kexec="k exec --stdin --tty"
#alias echoserver="socat -v tcp-l:1234,fork exec:'/bin/cat'"

# MISC
function ticket() {
	jira issue view $(git branch --show-current)
}
function sysgrep() {
	grep $1 /usr/include/asm/unistd_64.h
}

# environment
. "$HOME/.cargo/env"
#export LC_ALL=en_IN.UTF-8
#export LANG=en_IN.UTF-8
export HOMEBREW_NO_AUTO_UPDATE=1

# auto complete
source <(kubectl completion zsh)
