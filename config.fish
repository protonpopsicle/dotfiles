set -x PYTHONDONTWRITEBYTECODE True
set -x EDITOR 'emacs -nw'
alias emacs 'emacs -nw'

function fish_prompt
	set_color $fish_color_cwd
	echo -n (prompt_pwd)
	set_color normal
	echo -n ' > '
end

source ~/local.fish

switch (uname)
	case Linux
    		set -x PATH /usr/bin/core_perl /usr/local/sbin /usr/local/bin /usr/bin 
	case Darwin
    		set -x LEDGER_TERM 'aqua'
end
