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

(menu-bar-mode -1)
(delete-selection-mode 1)

(fset 'yes-or-no-p 'y-or-n-p)

(setq indent-tabs-mode nil) ;; no fucking tabs

;; automatically delete trailing whitespace before save
(add-hook 'before-save-hook 'delete-trailing-whitespace)

(require 'fill-column-indicator)
(setq fci-rule-column 80)
(add-hook 'prog-mode-hook 'fci-mode)

(add-hook 'prog-mode-hook 'show-paren-mode)

(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

(setq vc-handled-backends ()) ;; disable vc

;; org
(setq org-directory "~/Dropbox/org/")
(setq org-startup-indented t)
(setq org-log-done 'time)
(setq org-todo-keywords '("TODO" "NEXT" "WAITING" "SOMEDAY" "DONE"))
(setq org-tag-alist '(("@work" . ?w) ("@home" . ?h)))
(add-hook 'org-mode-hook (lambda () (visual-line-mode 1)))

;; org agenda
(define-key global-map "\C-ca" 'org-agenda)
(setq org-agenda-files (list org-directory))
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
(setq tex-run-command "xetex")

(setq ispell-program-name "aspell")
(setq ispell-list-command "--list")

(setenv "PATH" (concat (getenv "PATH") ":/usr/texbin:/usr/local/git/bin: \
/usr/local/bin:/usr/local/sbin"))
(add-to-list 'exec-path "/usr/local/bin")
(add-to-list 'exec-path "/usr/texbin")

(require 'projectile)

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
(scroll-bar-mode -1)
(add-to-list 'default-frame-alist '(font . "Menlo-11"))
(setq-default line-spacing .15)
(tool-bar-mode -1)
(set-fringe-mode 0)

(defun setup-gui ()
  (require 'moe-theme)
  (setq moe-theme-highlight-buffer-id nil)
  (require 'moe-theme-switcher)
  (moe-theme-random-color)
  (setq show-paren-style 'expression)
  (add-hook 'prog-mode-hook 'hl-line-mode)
  (add-hook 'dired-mode-hook 'hl-line-mode)
  (add-hook 'package-menu-mode-hook 'hl-line-mode)
  (add-hook 'buffer-menu-mode-hook 'hl-line-mode))

(unless window-system
  (custom-set-faces
   ;; custom-set-faces was added by Custom.
   ;; If you edit it by hand, you could mess it up, so be careful.
   ;; Your init file should contain only one such instance.
   ;; If there is more than one, they won't work right.
   '(org-hide ((t (:foreground "black"))))))

(if (daemonp)
    (add-hook 'after-make-frame-functions
        (lambda (frame)
            (with-selected-frame frame
               (setup-gui))))
  (when window-system (setup-gui))
)

;; hide org stars in terminal
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-hide ((t (:foreground "black")))))

(require 'markdown-mode)
(add-hook 'markdown-mode-hook (lambda () (visual-line-mode 1)))

(require 'yaml-mode)
(require 'twittering-mode)
