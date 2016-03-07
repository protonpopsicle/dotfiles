;; ~/.emacs.d/my-loadpackages.el

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(package-initialize)

(require 'ido-vertical-mode)
(ido-vertical-mode 1)
(setq ido-vertical-define-keys 'C-n-and-C-p-only)

(require 'auto-complete)
(global-auto-complete-mode t)

(require 'ledger-mode)
(add-to-list 'auto-mode-alist '("ledger\.dat\\'" . ledger-mode))

(require 'display-theme)
(global-display-theme-mode 1)

(require 'beacon)
(when (display-graphic-p) (beacon-mode 1))

(require 'theme-looper)
(theme-looper-set-theme-set
 (list 'manoj-dark 'light-blue 'organic-green 'arise 'caroline))
(global-set-key (kbd "C-|") 'theme-looper-enable-next-theme)
