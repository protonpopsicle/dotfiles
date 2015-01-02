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

(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

(setq vc-handled-backends ()) ;; disable vc

;; org
;; (add-to-list 'auto-mode-alist '("\\.txt\\'" . org-mode))
(setq org-directory "~/Dropbox/org/")
;; (setq org-startup-indented t)
(setq org-log-done 'time)
(setq org-todo-keywords '("NEXT" "WAITING" "SOMEDAY" "DONE"))
(add-hook 'org-mode-hook (lambda () (visual-line-mode 1)))

;; org agenda
(define-key global-map "\C-ca" 'org-agenda)
(setq org-agenda-files (list 
                        (concat org-directory "organizer.org")))
                        ;; (concat org-directory "somday.org")))
(setq org-agenda-custom-commands '(("n" todo "NEXT")))
(setq org-agenda-prefix-format 
      " %-16(concat (car (last (org-get-outline-path))) \":\")")

;; org capture
(setq org-capture-templates
      '(("i" "Inbox" entry
	 (file+headline (concat org-directory "organizer.org") "Inbox")
         "* NEXT %?")))

(define-key global-map "\C-cc"
        (lambda () (interactive) (org-capture nil "i")))

;; org refile
(setq org-refile-targets (quote ((nil :maxlevel . 3)
				 (org-agenda-files :maxlevel . 3))))
(setq org-refile-use-outline-path 'file)
;; (setq org-completion-use-ido t)
;; (setq org-outline-path-complete-in-steps nil)

;; TeX
(setq tex-run-command "xetex")

(setq ispell-program-name "aspell")
(setq ispell-list-command "--list")

(setenv "PATH" (concat (getenv "PATH") ":/usr/texbin:/usr/local/git/bin: \
/usr/local/bin:/usr/local/sbin"))
(add-to-list 'exec-path "/usr/local/bin")
(add-to-list 'exec-path "/usr/texbin")

(require 'projectile)
(projectile-global-mode 1)

(global-auto-revert-mode 1)

(global-set-key (kbd "C-x C-b") 'ibuffer)

(ido-mode t)
(require 'ido-vertical-mode)
(ido-vertical-mode 1)

(require 'flx-ido)
(flx-ido-mode 1)

(require 'auto-complete)
(global-auto-complete-mode t)

;; mode line settings
(line-number-mode t)
(column-number-mode t)

;; gui
(set-fringe-mode 4)
(scroll-bar-mode -1)
(add-to-list 'default-frame-alist '(font . "Menlo-11"))
(add-to-list 'default-frame-alist '(width . 85))
(add-to-list 'default-frame-alist '(height . 40))
(setq-default line-spacing .15)
(tool-bar-mode -1)

(defun setup-gui ()
  (require 'moe-theme)
  (setq moe-theme-highlight-buffer-id nil)
  (moe-dark)
  ;;(moe-theme-set-color 'red)
  ;; (Available colors: blue, orange, green ,magenta, yellow, purple, red, cyan, w/b.)
  (moe-theme-random-color)
  (setq show-paren-style 'expression)
  (add-hook 'prog-mode-hook 'hl-line-mode)
  (add-hook 'dired-mode-hook 'hl-line-mode)
  (add-hook 'package-menu-mode-hook 'hl-line-mode)
  (add-hook 'buffer-menu-mode-hook 'hl-line-mode))

;; (unless window-system
;;   (custom-set-faces
;;    ;; custom-set-faces was added by Custom.
;;    ;; If you edit it by hand, you could mess it up, so be careful.
;;    ;; Your init file should contain only one such instance.
;;    ;; If there is more than one, they won't work right.
;;    '(org-hide ((t (:foreground "black"))))))

;; (require 'fill-column-indicator)
;; (setq fci-rule-column 80)
;; (add-hook 'prog-mode-hook 'fci-mode)

(require 'whitespace)
(setq whitespace-line-column 80) ;; limit line length
(setq whitespace-style '(face lines-tail))

(add-hook 'prog-mode-hook 'whitespace-mode)

(if (daemonp)
    (add-hook 'after-make-frame-functions
        (lambda (frame)
            (with-selected-frame frame
               (setup-gui))))
  (when window-system (setup-gui))
)

(require 'markdown-mode)
(add-hook 'markdown-mode-hook (lambda () (visual-line-mode 1)))

(require 'yaml-mode)
;; (require 'twittering-mode)

(require 'automargin)
(setq automargin-target-width 100)
;; (custom-set-variables
;;  ;; custom-set-variables was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(ansi-color-names-vector ["#303030" "#ff4b4b" "#d7ff5f" "#fce94f" "#5fafd7" "#d18aff" "#afd7ff" "#c6c6c6"])
;;  '(custom-safe-themes (quote ("5b3bd478f014d1ff16e1f8ee6e13329c274dd33721f14459d0d2d8f6d93f629d" default))))
;; (custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(org-hide ((t (:foreground "black"))) t))

(require 'uniquify) ; bundled with GNU emacs 23.2.1 or before. On in 24.4
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)
