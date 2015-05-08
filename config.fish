set -x PYTHONDONTWRITEBYTECODE True
set -x API_CONFIG ~/team15/api/local_settings.py
set -x WEBAPP_CONFIG ~/team15/webapp/local_settings.py

set PATH /usr/local/sbin /usr/local/bin $PATH

function es
    /usr/local/Cellar/emacs/24.3/Emacs.app/Contents/MacOS/Emacs --daemon
end

function fish_prompt
    set_color $fish_color_cwd
    echo -n (basename $PWD)
    set_color normal
    echo -n '$ '
end

function fish_right_prompt
    set_color red
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ \1/' | cut -c -22
end