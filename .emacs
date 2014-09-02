(require 'package)
(package-initialize)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)

(setq backup-inhibited t)
(setq auto-save-default nil)

(setq inhibit-splash-screen t)
(setq initial-major-mode 'org-mode)

(scroll-bar-mode -1)
(menu-bar-mode -1)
(tool-bar-mode -1)

(delete-selection-mode 1)
(fset 'yes-or-no-p 'y-or-n-p)
(setq default-major-mode 'org-mode)

;; No fucking tabs
(setq indent-tabs-mode nil)

;; automatically delete trailing whitespace before save
(add-hook 'before-save-hook 'delete-trailing-whitespace)

(require 'fill-column-indicator)
(setq fci-rule-column 80)
(add-hook 'prog-mode-hook 'fci-mode)

(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
(add-hook 'prog-mode-hook 'show-paren-mode)

;; disable vc
(setq vc-handled-backends ())

;; org
(setq org-directory "~/Dropbox/org/")
(setq org-startup-indented t)
(setq org-log-done 'time)
(setq org-todo-keywords '("TODO" "NEXT" "WAITING" "SOMEDAY" "DONE"))
(add-hook 'org-mode-hook (lambda () (visual-line-mode 1)))

;; org agenda
(define-key global-map "\C-ca" 'org-agenda)
(setq org-agenda-files (list (concat org-directory "organizer.org")))
(setq org-agenda-custom-commands '(("n" todo "NEXT")))

;; org capture
(setq org-capture-templates
      '(("i" "Inbox" entry
	 (file+headline (concat org-directory "organizer.org") "Inbox")
         "* TODO %?")))

(define-key global-map "\C-cc"
        (lambda () (interactive) (org-capture nil "i")))

;; org refile
(setq org-refile-targets (quote ((nil :maxlevel . 5)
				 (org-agenda-files :maxlevel . 5))))
(setq org-refile-use-outline-path t)
(setq org-completion-use-ido t)
(setq org-outline-path-complete-in-steps nil)

;; TeX
(setq latex-run-command "xelatex")
(setq tex-run-command "xetex")

;; fonts
(add-to-list 'default-frame-alist '(font . "Menlo-11"))
(setq-default line-spacing .15)
(set-default 'cursor-type '(bar . 1))

(setq ispell-program-name "aspell")
(setq ispell-list-command "--list")

(setenv "PATH" (concat (getenv "PATH") ":/usr/texbin:/usr/local/git/bin: \
/usr/local/bin:/usr/local/sbin"))
(add-to-list 'exec-path "/usr/local/bin")
(add-to-list 'exec-path "/usr/texbin")

(require 'projectile)
(projectile-global-mode)

(global-auto-revert-mode 1)

(global-set-key (kbd "C-x C-b") 'ibuffer)

(ido-mode t)
;;(require 'ido-vertical-mode)
;;(ido-vertical-mode 1)

(require 'flx-ido)
(flx-ido-mode 1)

;; disable flx highlights.
;; (setq flx-ido-use-faces nill)

(require 'auto-complete)
(global-auto-complete-mode t)

;; nice scrolling
(setq scroll-margin 3
      scroll-conservatively 100000
      scroll-preserve-screen-position 1)

;; mode line settings
(line-number-mode t)
(column-number-mode t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("5b3bd478f014d1ff16e1f8ee6e13329c274dd33721f14459d0d2d8f6d93f629d" "5d9351cd410bff7119978f8e69e4315fd1339aa7b3af6d398c5ca6fac7fd53c7" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-hide ((t (:foreground "black")))))
