set -x PATH /usr/local/sbin /usr/local/bin $PATH
set -x PYTHONDONTWRITEBYTECODE True
alias emacs "emacs -nw"
set -x EDITOR emacs

set -x API_CONFIG ~/team15/api/local_settings.py
set -x WEBAPP_CONFIG ~/team15/webapp/local_settings.py

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
