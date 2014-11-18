set -x PYTHONDONTWRITEBYTECODE True

function es
    /usr/local/Cellar/emacs/24.3/Emacs.app/Contents/MacOS/Emacs --daemon
end

function fish_right_prompt
    set_color red
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ \1/'
end