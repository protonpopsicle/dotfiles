;; ~/.emacs.d/my-noexternals.el

(setq backup-inhibited t)
(setq auto-save-default nil)

(setq inhibit-startup-screen t)
(setq initial-scratch-message nil)
(setq initial-major-mode 'text-mode)

(menu-bar-mode -1)
(scroll-bar-mode -1)

(delete-selection-mode 1)

(fset 'yes-or-no-p 'y-or-n-p)

(setq vc-handled-backends nil)
(add-hook 'prog-mode-hook 'show-paren-mode)

;; org
;; (setq org-directory "~/Dropbox/org/")
;; (add-hook 'org-mode-hook (lambda () (visual-line-mode 1)))

;; (setq js-indent-level 2)

;; TeX
;; (setq tex-run-command "xetex")
;; (setenv "PATH" (concat (getenv "PATH") ":/Library/TeX/texbin:/usr/local/git/bin:/usr/local/bin:/usr/local/sbin"))
;; (add-to-list 'exec-path "/usr/texbin")

(add-to-list 'exec-path "/usr/local/bin")

(global-auto-revert-mode 1)

(global-set-key (kbd "C-x C-b") 'ibuffer)

;; mode line settings
(line-number-mode 1)
(column-number-mode 1)

(ido-mode 1)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)

(setq whitespace-line-column 80) ; limit line length
(setq whitespace-style '(face lines-tail))
(add-hook 'prog-mode-hook 'whitespace-mode)

;; gui
(when (display-graphic-p)
  (set-fringe-mode 4)
  (tool-bar-mode -1)
  (setq-default line-spacing .15)
  ;; (load-theme 'manoj-dark t)
  (setq show-paren-style 'expression))

;; keep dat shit out of .emacs
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file 'noerror)
