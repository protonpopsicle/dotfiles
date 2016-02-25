set fish_greeting ''

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

# https://github.com/fish-shell/fish-shell/issues/1772
# start X at login
if status --is-login
    if test -z "$DISPLAY" -a $XDG_VTNR -eq 1
        exec startx -- -keeptty
    end
end
