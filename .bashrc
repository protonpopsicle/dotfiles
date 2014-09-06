export PATH=~/.cabal/bin:/usr/local/bin:/usr/local/mysql/bin:$PATH
export CFLAGS=-Qunused-arguments
export CPPFLAGS=-Qunused-arguments
export PYTHONDONTWRITEBYTECODE=True

# Daemon mode with OS X GUI Emacs
EMACS_APP="/usr/local/Cellar/emacs/24.3/Emacs.app"
alias es="$EMACS_APP/Contents/MacOS/Emacs --daemon"
# alias emacs="emacsclient -c -n"
# export EDITOR='$emacsclient -c'

# Daemon mode in the Terminal
# alias emacs="emacsclient -ct"
# alias es="emacs --daemon"

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

#### automatically activate virtualenvs named 'venv'
#### just put this at the end of your ~/.bashrc file
workon_virtualenv() {
    if [ -e "${PWD}/venv" ]; then
        deactivate >/dev/null 2>&1
        source "${PWD}/venv/bin/activate"
    fi
}

virtualenv_cd() {
    cd "$@" && workon_virtualenv
}

alias cd="virtualenv_cd"
workon_virtualenv
#### /
