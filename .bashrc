export PATH=/usr/local/bin:/usr/local/mysql/bin:$PATH
export MARKPATH=$HOME/.marks

function jump { 
    cd -P "$MARKPATH/$1" 2>/dev/null || echo "No such mark: $1"
}
function mark { 
    mkdir -p "$MARKPATH"; ln -s "$(pwd)" "$MARKPATH/$1"
}
function unmark { 
    rm -i "$MARKPATH/$1"
}
function marks {
    \ls -l "$MARKPATH" | tail -n +2 | sed 's/  / /g' | cut -d' ' -f9- | awk -F ' -> ' '{printf "%-10s -> %s\n", $1, $2}'
}

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
