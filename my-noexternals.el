;; ~/.emacs.d/my-noexternals.el

(setq backup-inhibited t)
(setq auto-save-default nil)

;; (setq inhibit-startup-screen t)
;; (setq initial-scratch-message nil)
;; (setq initial-major-mode 'text-mode)

(menu-bar-mode -1)

(delete-selection-mode 1)

(fset 'yes-or-no-p 'y-or-n-p)

(setq vc-handled-backends nil)
(add-hook 'prog-mode-hook 'show-paren-mode)

(setq-default c-basic-offset 4)
(c-set-offset 'case-label '+)
(defun my-c-mode-hook ()
  (setq indent-tabs-mode t)
  (setq tab-width 4))
(add-hook 'c-mode-common-hook 'my-c-mode-hook)

;; TeX
(setq tex-run-command "xetex")
(setenv "PATH" (concat (getenv "PATH") ":/Library/TeX/texbin"))
(add-to-list 'exec-path "/usr/texbin")

(add-to-list 'exec-path "/usr/local/bin")

(global-auto-revert-mode 1)

(global-set-key (kbd "C-x C-b") 'ibuffer)

(setq auto-indent-newline-function 'newline-and-indent) 

;; mode line settings
(line-number-mode 1)
(column-number-mode 1)

(ido-mode 1)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)

(setq whitespace-line-column 100) ; limit line length
(setq whitespace-style '(face lines-tail))
(add-hook 'prog-mode-hook 'whitespace-mode)

;; gui
(when (display-graphic-p)
  (set-fringe-mode 4)
  (tool-bar-mode -1)
  ;; (setq-default line-spacing .15)
  (scroll-bar-mode -1)
  ;; (load-theme 'manoj-dark t)
  (setq show-paren-style 'expression))

;; keep dat shit out of .emacs
(setq custom-file "~/.emacs.d/custom.el")
;; (load custom-file 'noerror)
