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
;; (setq org-startup-indented t)
(setq org-log-done 'time)
;; (setq org-todo-keywords '("NEXT" "WAITING" "SOMEDAY" "DONE"))
(add-hook 'org-mode-hook (lambda () (visual-line-mode 1)))
(setq org-ellipsis " ▼")

;; org agenda
;; (define-key global-map (kbd "C-c a") 'org-agenda)
;; (setq org-agenda-files (list
;;                         (concat org-directory "organizer.org")))
;; (setq org-agenda-custom-commands '(("n" todo "NEXT")))
;; (setq org-agenda-prefix-format
;;       " %-28(concat (car (last (org-get-outline-path))) \":\")")

;; org capture
;; (setq org-capture-templates
;;       '(("i" "Inbox" entry
;; 	 (file+headline (concat org-directory "organizer.org") "Inbox")
;;          "* NEXT %?")))

;; (define-key global-map "\C-cc"
;;         (lambda () (interactive) (org-capture nil "i")))

;; org refile
;; (setq org-refile-targets (quote ((nil :maxlevel . 3)
;; 				 (org-agenda-files :maxlevel . 3))))
;; (setq org-refile-use-outline-path 'file)
;; (setq org-completion-use-ido t)
;; (setq org-outline-path-complete-in-steps nil)

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

;; (unless window-system
;;   (custom-set-faces
;;    ;; custom-set-faces was added by Custom.
;;    ;; If you edit it by hand, you could mess it up, so be careful.
;;    ;; Your init file should contain only one such instance.
;;    ;; If there is more than one, they won't work right.
;;    '(org-hide ((t (:foreground "black"))))))

(require 'whitespace)
(setq whitespace-line-column 80) ;; limit line length
(setq whitespace-style '(face lines-tail))

(add-hook 'prog-mode-hook 'whitespace-mode)

;;(require 'markdown-mode)
;;(add-hook 'markdown-mode-hook (lambda () (visual-line-mode 1)))

(require 'uniquify) ; bundled with GNU emacs 23.2.1 or before. On in 24.4
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("ba9be9caf9aa91eb34cf11ad9e8c61e54db68d2d474f99a52ba7e87097fa27f5" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
