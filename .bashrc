parse_git_branch() {
    git branch --color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\ →\ \1/'
}

export PS1='\u@\h:$(parse_git_branch) '
export PROMPT_COMMAND='echo -ne "\033]0;${PWD}\007"'
export PATH=$PATH:/usr/local/bin/
