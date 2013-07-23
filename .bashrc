export PATH=$PATH:/usr/local/bin/:/usr/local/mysql/bin

#### automatically activate virtualenvs named 'pyenv'
#### just put this at the end of your ~/.bashrc file
workon_virtualenv() {
    if [ -e "${PWD}/pyenv" ]; then
        deactivate >/dev/null 2>&1
        source "${PWD}/pyenv/bin/activate"
    fi
}

virtualenv_cd() {
    cd "$@" && workon_virtualenv
}

alias cd="virtualenv_cd"
workon_virtualenv
#### /
