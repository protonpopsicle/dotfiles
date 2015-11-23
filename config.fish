set -x PATH /usr/local/sbin $PATH
set -x PYTHONDONTWRITEBYTECODE True
set -x EDITOR 'emacs -nw'
set -x LEDGER_TERM 'aqua'

set -x API_CONFIG ~/team15/api/local_settings.py
set -x WEBAPP_CONFIG ~/team15/webapp/local_settings.py

alias emacs 'emacs -nw'

function fish_prompt
	set_color $fish_color_cwd
	echo -n (basename $PWD)
	set_color normal
	echo -n '$ '
end

function fish_right_prompt
	set_color  red
	git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ \1/' | cut -c -22
end
