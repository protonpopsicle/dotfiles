(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/") t)
(package-initialize)

;; disable auto-save and auto-backup
(setq auto-save-default nil)
(setq make-backup-files nil)

;; startup
;;(setq inhibit-splash-screen t)
;;(add-hook 'after-init-hook 'org-agenda-list)

;; org
(define-key global-map "\C-ca" 'org-agenda)
(setq org-agenda-files (list "~/org/todo.org"))
(setq org-log-done 'time)

;; TeX
(setq latex-run-command "xelatex")
(setq tex-run-command "xetex")

;; fonts
;;(add-to-list 'default-frame-alist '(font . "Menlo-11"))

;; theme
;;(require 'cyberpunk-theme)
;;(load-theme 'cyberpunk t)

;; spellcheck
(setq ispell-program-name "aspell")
(setq ispell-list-command "--list")

;; path stuff
(setenv "PATH" (concat (getenv "PATH") ":/usr/texbin:/usr/local/git/bin:/usr/local/bin:/usr/local/sbin"))
(add-to-list 'exec-path "/usr/local/bin")
(add-to-list 'exec-path "/usr/texbin")

(require 'projectile)
(projectile-global-mode)
;;(define-key projectile-mode-map [?\s-p] 'projectile-switch-project)
;;(define-key projectile-mode-map [?\s-f] 'projectile-find-file)
;;(define-key projectile-mode-map [?\s-b] 'projectile-switch-to-buffer)
;;(setq projectile-switch-project-action 'projectile-dired)

;;(setq-default line-spacing .15)

(delete-selection-mode 1)

;;(set-default 'cursor-type '(bar . 1))

(global-auto-revert-mode 1)

(global-set-key (kbd "C-x C-b") 'ibuffer)

(ido-mode t)
(require 'ido-vertical-mode)
(ido-vertical-mode 1)

(require 'flx-ido)
(flx-ido-mode 1)

;; disable flx highlights.
;; (setq flx-ido-use-faces nill)

(require 'auto-complete)
(global-auto-complete-mode t)

(add-hook 'python-mode-hook (lambda () (show-paren-mode 1)))
(add-hook 'emacs-lisp-mode (lambda () (show-paren-mode 1)))

;; nice scrolling
(setq scroll-margin 3
      scroll-conservatively 100000
      scroll-preserve-screen-position 1)

;; mode line settings
(line-number-mode t)
(column-number-mode t)
(size-indication-mode t)

;; enable y/n answers
(fset 'yes-or-no-p 'y-or-n-p)

;; disable UI
;;(scroll-bar-mode -1)
;;(setq use-dialog-box nil)
(menu-bar-mode -1)
;;(tool-bar-mode -1)

;; modified from writeroom-mode source
(setq writeroom-width 100)

(defun writeroom--set-margins (window)
      (let ((current-width (window-total-width window)))
        (setq margin
              (cond
               ((integerp writeroom-width)
                (/ (- current-width writeroom-width) 2))
               ((floatp writeroom-width)
                (/ (- current-width (truncate (* current-width writeroom-width))) 2)))))
  (set-window-margins window margin margin))


(defun distraction-free ()
  (visual-line-mode t)
  (writeroom--set-margins (selected-window))
)

(add-hook 'text-mode-hook 'distraction-free)
(add-hook 'markdown-mode-hook 'distraction-free)
