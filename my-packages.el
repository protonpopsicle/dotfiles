;; ~/.emacs.d/my-packages.el
(require 'cl)

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(package-initialize)

(defvar required-packages
  '(
    ido-vertical-mode
    auto-complete
    ledger-mode
    display-theme
    theme-looper
    beacon
    organic-green-theme
    caroline-theme
    ) "a list of packages to ensure are installed at launch.")

(unless package-archive-contents
  (message "%s" "Emacs is now refreshing its package database...")
  (package-refresh-contents))

(defun ensure-packages (packages)
  (dolist (package packages)
    (unless (package-installed-p package)
      (package-install package))))

(ensure-packages required-packages)
