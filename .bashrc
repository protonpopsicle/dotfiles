# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

if [ -f ~/git-completion.bash ]; then
	source ~/git-completion.bash
fi

alias emacs="emacs -nw"

export NACL_SDK_ROOT=~/Downloads/nacl_sdk/pepper_42
export PATH=/usr/local/sbin:~/tizen-sdk/tools:~/tizen-sdk/tools/ide/bin:$PATH
export CERT=test
export EDITOR="emacs -nw"
export AWS_DEFAULT_PROFILE=avplatformadmin
