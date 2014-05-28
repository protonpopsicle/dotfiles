(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/") t)
(package-initialize)

(setq load-path (cons "~/tidal/" load-path))
(when (require 'tidal nil 'noerror)
  (setq tidal-interpreter "/usr/local/bin/ghci"))

;; disable auto-save and auto-backup
(setq auto-save-default nil)
(setq make-backup-files nil)

;; startup
(setq inhibit-splash-screen t)
;;(add-hook 'after-init-hook 'org-agenda-list)

;; disable UI
(scroll-bar-mode -1)
(setq use-dialog-box nil)
(menu-bar-mode -1)
(tool-bar-mode -1)

(setq default-frame-alist '(
                (width . 106)
                (height . 47)))

;; org
(define-key global-map "\C-ca" 'org-agenda)
(setq org-agenda-files (list "~/org/todo.org"))
(setq org-log-done 'time)

;; TeX
;;(setq latex-run-command "xelatex")

;; fonts
(add-to-list 'default-frame-alist '(font . "Menlo-11"))

;; image-dired
(setq image-dired-show-all-from-dir-max-files 100)
(setq image-dired-external-viewer "open")

;; theme
(require 'cyberpunk-theme)
(load-theme 'cyberpunk t)

;; spellcheck
(setq ispell-program-name "aspell")

;; path stuff
(setenv "PATH" (concat (getenv "PATH") ":/usr/texbin:/usr/local/git/bin:/usr/local/bin:/usr/local/sbin"))
(add-to-list 'exec-path "/usr/local/bin")
(add-to-list 'exec-path "/usr/texbin")

(require 'projectile)
(projectile-global-mode)
(define-key projectile-mode-map [?\s-p] 'projectile-switch-project)
(define-key projectile-mode-map [?\s-f] 'projectile-find-file)
(define-key projectile-mode-map [?\s-g] 'projectile-grep)

(setq-default line-spacing .15)

(delete-selection-mode 1)

(set-default 'cursor-type '(bar . 1))

(global-auto-revert-mode 1)

;; (global-set-key (kbd "C-x C-b") 'ibuffer)
(define-key global-map [?\s-b] 'ibuffer)

(require 'sml-modeline)
(sml-modeline-mode 1)

(ido-mode t)

(require 'ido-vertical-mode)
(ido-vertical-mode 1)

;; (setq id-enable-flex-matching t)
(ido-everywhere 1)

(require 'flx-ido)
(flx-ido-mode 1)
;; disable ido faces to see flx highlights.
;;(setq ido-use-faces nil)
(setq flx-ido-use-faces nil)

(require 'auto-complete)
(global-auto-complete-mode t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector ["#000000" "#8b0000" "#00ff00" "#ffa500" "#7b68ee" "#dc8cc3" "#93e0e3" "#dcdccc"])
 '(custom-safe-themes (quote ("758da0cfc4ecb8447acb866fb3988f4a41cf2b8f9ca28de9b21d9a68ae61b181" "77d704908bf206929237af1089f020781963dcc671489005fb8153c1745f689a" "5b3bd478f014d1ff16e1f8ee6e13329c274dd33721f14459d0d2d8f6d93f629d" default)))
 '(fci-rule-color "#383838"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(defun linum-on ()
  (linum-mode 1))

(add-hook 'python-mode-hook 'linum-on)
(add-hook 'python-mode-hook (lambda () (show-paren-mode 1)))
(add-hook 'emacs-lisp-mode (lambda () (show-paren-mode 1)))

;; nice scrolling
(setq scroll-margin 0
      scroll-conservatively 100000
      scroll-preserve-screen-position 1)

;; mode line settings
(line-number-mode t)
(column-number-mode t)
(size-indication-mode t)

;; make the fringe (gutter) smaller
;; the argument is a width in pixels (the default is 8)
(if (fboundp 'fringe-mode)
    (fringe-mode 4))

;; enable y/n answers
(fset 'yes-or-no-p 'y-or-n-p)

;; diminish keeps the modeline tidy
;; (when (require 'diminish nil 'noerror)
;;   (eval-after-load "projectile"
;;       '(diminish 'projectile-mode "︻╦╤─")))
