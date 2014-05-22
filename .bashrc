export PATH=~/.cabal/bin:/usr/local/bin:/usr/local/mysql/bin:$PATH
export CFLAGS=-Qunused-arguments
export CPPFLAGS=-Qunused-arguments

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
