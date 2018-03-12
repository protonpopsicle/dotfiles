;; ~/.emacs.d/my-packages.el

(defvar required-packages
  '(
    ido-vertical-mode
    auto-complete
    ledger-mode
    rainbow-mode
    beacon
    display-theme
    theme-looper
    organic-green-theme
    ) "a list of packages to ensure are installed.")

(package-initialize)

(unless package-archive-contents
  (message "%s" "Emacs is now refreshing its package database...")
  (package-refresh-contents))

(defun ensure-packages ()
  (interactive)
  (dolist (package required-packages)
    (unless (package-installed-p package)
      (package-install package))))
