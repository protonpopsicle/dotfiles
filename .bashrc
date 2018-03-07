# Source global definitions
#if [ -f /etc/bashrc ]; then
#	. /etc/bashrc
#fi

alias screenfix="sudo /etc/init.d/screen-cleanup start"
sshfix() {
    eval $(ssh-agent)
    ssh-add
}

alias emacs="emacs -nw"
export EDITOR="emacs -nw"
bind 'set mark-symlinked-directories on'
export VAGRANT_WSL_ENABLE_WINDOWS_ACCESS="1"
