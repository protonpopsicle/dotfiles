;; ~/.emacs.d/my-loadpackages.el
;; loading package
(load "~/.emacs.d/my-packages.el")

(require 'ido-vertical-mode)
(ido-vertical-mode 1)

(require 'auto-complete)
(global-auto-complete-mode t)

(require 'ledger-mode)
(add-to-list 'auto-mode-alist '("ledger\.dat\\'" . ledger-mode))

(require 'display-theme)
(global-display-theme-mode 1)

(require 'beacon)

(require 'theme-looper)
(theme-looper-set-theme-set (list 'manoj-dark 'light-blue 'organic-green 'hemisu-dark))
(global-set-key (kbd "C-|") 'theme-looper-enable-next-theme)

;; gui
(when window-system
  (beacon-mode 1)
  (load-theme 'manoj-dark t))
