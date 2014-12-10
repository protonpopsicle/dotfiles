set -x PYTHONDONTWRITEBYTECODE True
set -x RHIZ_APPLICATION_SETTINGS ~/local_config.py

set PATH /usr/local/sbin /usr/local/bin /Users/smeisburger/tizen-sdk/tools/ide/bin $PATH

function es
    /usr/local/Cellar/emacs/24.3/Emacs.app/Contents/MacOS/Emacs --daemon
end

function fish_right_prompt
    set_color red
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ \1/' | cut -c -22
end