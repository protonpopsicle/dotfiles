(require 'package)
(package-initialize)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)

(setq backup-inhibited t)
(setq auto-save-default nil)

(setq inhibit-splash-screen t)
(setq initial-major-mode 'text-mode)
(setq initial-scratch-message "")

(menu-bar-mode -1)
(delete-selection-mode 1)

(fset 'yes-or-no-p 'y-or-n-p)

(setq indent-tabs-mode nil) ;; no tabs

;; automatically delete trailing whitespace before save
;; this fucks up markdown files
(add-hook 'before-save-hook 'delete-trailing-whitespace)

(add-hook 'prog-mode-hook 'show-paren-mode)

(setq vc-handled-backends ()) ;; disable vc

;; org
(setq org-directory "~/Dropbox/org/")
(setq org-html-doctype "html5")
(setq org-log-done 'time)
(add-hook 'org-mode-hook (lambda () (visual-line-mode 1)))
(setq org-ellipsis " ▼")

(setq js-indent-level 2)

;; TeX
(setq tex-run-command "xetex")

(setq ispell-program-name "aspell")
(setq ispell-list-command "--list")

(setenv "PATH" (concat (getenv "PATH") ":/Library/TeX/texbin:/usr/local/git/bin:/usr/local/bin:/usr/local/sbin"))
(add-to-list 'exec-path "/usr/local/bin")
(add-to-list 'exec-path "/usr/texbin")

(global-auto-revert-mode 1)

(global-set-key (kbd "C-x C-b") 'ibuffer)

(ido-mode t)
(require 'ido-vertical-mode)
(ido-vertical-mode 1)

(require 'auto-complete)
(global-auto-complete-mode t)

;; mode line settings
(line-number-mode t)
(column-number-mode t)

(require 'ledger-mode)
(add-to-list 'auto-mode-alist '("ledger\.dat\\'" . ledger-mode))

;; gui
(defun setup-gui ()
  (set-fringe-mode 4)
  (scroll-bar-mode -1)
  (add-to-list 'default-frame-alist '(width . 85))
  (add-to-list 'default-frame-alist '(height . 40))
  (setq-default line-spacing .15)
  (tool-bar-mode -1)
  (load-theme 'hemisu-light t)
  (require 'display-theme)
  (global-display-theme-mode 1)
  (require 'theme-looper)
  (theme-looper-set-theme-set (list 'hemisu-light 'planet 'light-blue
				    'hemisu-dark 'organic-green 'caroline))
  (global-set-key (kbd "C-|") 'theme-looper-enable-next-theme)
  (setq show-paren-style 'expression)
  (require 'beacon)
  (beacon-mode 1))
(when window-system (setup-gui))

(require 'whitespace)
(setq whitespace-line-column 80) ;; limit line length
(setq whitespace-style '(face lines-tail))

(add-hook 'prog-mode-hook 'whitespace-mode)

(require 'uniquify) ; bundled with GNU emacs 23.2.1 or before. On in 24.4
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)
