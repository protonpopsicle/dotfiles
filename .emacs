(require 'package)
(package-initialize)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)

(setq backup-inhibited t)
(setq auto-save-default nil)

(setq inhibit-splash-screen t
      initial-scratch-message nil
      initial-major-mode 'org-mode)

(scroll-bar-mode -1)
(menu-bar-mode -1)
(tool-bar-mode -1)

(delete-selection-mode 1)

;; No fucking tabs
(setq indent-tabs-mode nil)

(fset 'yes-or-no-p 'y-or-n-p)

(global-set-key (kbd "C-+") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)

(setq echo-keystrokes 0.1
      use-dialog-box nil)

(add-hook 'emacs-startup-hook 'org-agenda-list)

;; org
(define-key global-map "\C-ca" 'org-agenda)
(setq org-agenda-files (list "~/Dropbox/org/todo.org"))
(setq org-log-done 'time)
;;(setq org-link-frame-setup '((file . find-file)))
;;(setq org-hide-leading-stars 1)
(setq org-startup-indented 1)
(setq org-return-follows-link t)
(setq org-odd-levels-only t)

;;SET EMACS AS DEFAULT MAJOR MODE TO FOR ALL FILES WITH AN UNSPECIFIED MODE
(setq default-major-mode 'org-mode)

;;OPEN ALL TXT FILES IN ORGMODE
(add-to-list 'auto-mode-alist '("\\.txt$" . org-mode))

;; TeX
(setq latex-run-command "xelatex")
(setq tex-run-command "xetex")

;; fonts
(add-to-list 'default-frame-alist '(font . "Menlo-11"))
(setq-default line-spacing .15)
(set-default 'cursor-type '(bar . 1))

;; theme
;;(require 'cyberpunk-theme)
;;(load-theme 'cyberpunk t)

;; spellcheck
(setq ispell-program-name "aspell")
(setq ispell-list-command "--list")

(setenv "PATH" (concat (getenv "PATH") ":/usr/texbin:/usr/local/git/bin:/usr/local/bin:/usr/local/sbin"))
(add-to-list 'exec-path "/usr/local/bin")
(add-to-list 'exec-path "/usr/texbin")

(require 'projectile)
(projectile-global-mode)

(global-auto-revert-mode 1)

;;(global-set-key (kbd "C-x C-b") 'ibuffer)

(ido-mode t)
;; (require 'ido-vertical-mode)
;; (ido-vertical-mode 1)

(require 'flx-ido)
(flx-ido-mode 1)

;; disable flx highlights.
;; (setq flx-ido-use-faces nill)

(require 'auto-complete)
(global-auto-complete-mode t)

;;(add-hook 'python-mode-hook (lambda () (show-paren-mode 1)))
;;(add-hook 'emacs-lisp-mode (lambda () (show-paren-mode 1)))


;; nice scrolling
(setq scroll-margin 3
      scroll-conservatively 100000
      scroll-preserve-screen-position 1)

;; mode line settings
(line-number-mode t)
(column-number-mode t)
;;(size-indication-mode t)


;; modified from writeroom-mode source

(defun writers-mode-set-margins (window chars-wide)
      (let ((current-width (window-total-width window)))
        (setq margin
              (cond
               ((integerp chars-wide)
                (/ (- current-width chars-wide) 2))
               ((floatp chars-wide)
                (/ (- current-width (truncate (* current-width chars-wide))) 2)))))
  (set-window-margins window margin margin))

(defun distraction-free (chars-wide)
  (interactive "nLine width in characters? ")
  (visual-line-mode t)
  (setq mode-line-format nil)
  (writers-mode-set-margins (selected-window) chars-wide))


;; (add-hook 'text-mode-hook 'distraction-free)
;; (add-hook 'markdown-mode-hook 'distraction-free)


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

;; automatically delete trailing whitespace before save
(add-hook 'before-save-hook 'delete-trailing-whitespace)

(setq fci-rule-column 80)
(add-hook 'python-mode-hook 'fci-mode)

(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
(add-hook 'prog-mode-hook 'show-paren-mode)

;; disable vc
(setq vc-handled-backends ())
