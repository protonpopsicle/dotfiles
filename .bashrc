parse_git_branch() {
    git branch --color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\ →\ \1/'
}

export PS1='\u@\h:$(parse_git_branch) '
export PROMPT_COMMAND='echo -ne "\033]0;${PWD}\007"'
export PATH=$PATH:/usr/local/bin/

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
