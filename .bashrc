HISTCONTROL=ignorespace
TERM=xterm
PS1="[Bash] \W > "
alias la="ls -la"
alias i="sudo dnf install"
alias q="sudo dnf search"
alias v="nvim"
alias nano="nvim"
alias gc="git commit -m"
alias ga="git add"
alias gs="git status"
alias gpush="git push"
alias gpull="git pull"
alias pw=" pwgen -s 64 | tr -d '\n' | clipman"
alias qr=" qrencode -t ANSI256"

shopt -s autocd
shopt -s checkwinsize

if ! pgrep -u "$USER" ssh-agent > /dev/null; then
    ssh-agent -t 1h > "$XDG_RUNTIME_DIR/ssh-agent.env"
fi
if [[ ! "$SSH_AUTH_SOCK" ]]; then
    source "$XDG_RUNTIME_DIR/ssh-agent.env" >/dev/null
fi

