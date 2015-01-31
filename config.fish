set -x PYTHONDONTWRITEBYTECODE True
#set -x EDITOR editor
set -x RHIZ_APPLICATION_SETTINGS ~/local_config.py
set -x PERCH_WEBAPP_SETTINGS ~/team15/flask-webapp/local_settings.py

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