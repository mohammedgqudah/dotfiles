#precmd() {
#	print -rP "%F{blue}[%~]%f"
#}
#PS1='%F{blue}>>%f '
plugins=(git)

# aliases
#
alias clearr="printf '\033[2J\033[3J\033[1;1H'"
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
alias get_idf='. $HOME/esp/esp-idf/export.sh'

# MISC
function ticket() {
	jira issue view $(git branch --show-current)
}
# get syscall number
function sysgrep() {
	grep $1 /usr/include/asm/unistd_64.h
}
alias ppt2pdf="libreoffice --headless --invisible --convert-to pdf"

function elfdiff() {
  if [[ $# -ne 2 ]]; then
    echo "Usage: elfdiff <file1> <file2>"
    return 1
  fi

  local file1="$1"
  local file2="$2"

  # Check if both files exist
  if [[ ! -f "$file1" || ! -f "$file2" ]]; then
    echo "Error: One or both files do not exist."
    return 1
  fi

  # Create temporary files for disassembly output
  local tmp1=$(mktemp /tmp/elfdiff1.XXXXXX)
  local tmp2=$(mktemp /tmp/elfdiff2.XXXXXX)

  # Disassemble both binaries
  objdump -d "$file1" > "$tmp1"
  objdump -d "$file2" > "$tmp2"

  # Open in Neovim diff mode
  nvim -d "$tmp1" "$tmp2"

  # Clean up temporary files after Neovim exits
  rm -f "$tmp1" "$tmp2"
}

function bindiff() {
  if [[ $# -ne 2 ]]; then
    echo "Usage: bindiff <file1> <file2>"
    return 1
  fi

  local file1="$1"
  local file2="$2"

  # Check if both files exist
  if [[ ! -f "$file1" || ! -f "$file2" ]]; then
    echo "Error: One or both files do not exist."
    return 1
  fi

  # Create temporary files for disassembly output
  local tmp1=$(mktemp /tmp/bindiff1.XXXXXX)
  local tmp2=$(mktemp /tmp/bindiff2.XXXXXX)

  # Disassemble both binaries
  xxd "$file1" > "$tmp1"
  xxd "$file2" > "$tmp2"

  # Open in Neovim diff mode
  nvim -d "$tmp1" "$tmp2"

  # Clean up temporary files after Neovim exits
  rm -f "$tmp1" "$tmp2"
}

# environment
. "$HOME/.cargo/env"
#export LC_ALL=en_IN.UTF-8
#export LANG=en_IN.UTF-8
export HOMEBREW_NO_AUTO_UPDATE=1
export MANPAGER='nvim +Man!'

# auto complete
source <(kubectl completion zsh)

# Docker
alias drm="docker container rm"
