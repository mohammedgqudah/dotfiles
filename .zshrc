# aliases
#
alias zshconfig="nvim ~/.config/.zshrc"
alias :q="exit"
alias k="kubectl"
alias kgp="k get pods"
alias kgd="k get deploy"
alias kgsvc="k get svc"
alias kdesc="k describe"
alias :tabnew="open -a ITerm ."
alias kn="kubectl config set-context --current --namespace"
alias kexec="k exec --stdin --tty"

# MISC
function nman () {"nvim -c ':Man $1'"}
function ticket() {
	jira issue view $(git branch --show-current)
}

# environment
. "$HOME/.cargo/env"
export LC_ALL=en_IN.UTF-8
export LANG=en_IN.UTF-8

# auto complete
[[ $commands[kubectl] ]] && source <(kubectl completion zsh)
