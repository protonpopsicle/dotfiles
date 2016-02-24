;; ~/.emacs.d/my-noexternals.el

(setq backup-inhibited t)
(setq auto-save-default nil)

(setq inhibit-splash-screen t)
(setq initial-scratch-message nil)

(setq initial-major-mode 'text-mode)

(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)

(delete-selection-mode 1)

(fset 'yes-or-no-p 'y-or-n-p)

(setq vc-handled-backends nil)
(add-hook 'prog-mode-hook 'show-paren-mode)

;; org
(setq org-directory "~/Dropbox/org/")
(setq org-html-doctype "html5")
(setq org-log-done 'time)
(add-hook 'org-mode-hook (lambda () (visual-line-mode 1)))
(setq org-ellipsis " ▼")

(setq js-indent-level 2)

(setq ispell-program-name "aspell")
(setq ispell-list-command "--list")

(setq tex-run-command "xetex")
(setenv "PATH" (concat (getenv "PATH") ":/Library/TeX/texbin:/usr/local/git/bin:/usr/local/bin:/usr/local/sbin"))
(add-to-list 'exec-path "/usr/local/bin")
(add-to-list 'exec-path "/usr/texbin")

(global-auto-revert-mode 1)

(global-set-key (kbd "C-x C-b") 'ibuffer)

;; mode line settings
(line-number-mode t)
(column-number-mode t)

(ido-mode t)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)

;; keep dat shit out of .emacs
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file 'noerror)

(setq whitespace-line-column 80) ; limit line length
(setq whitespace-style '(face lines-tail))
(add-hook 'prog-mode-hook 'whitespace-mode)

;; gui
(when window-system
  (set-fringe-mode 4)
  (add-to-list 'default-frame-alist '(width . 85))
  (add-to-list 'default-frame-alist '(height . 40))
  (setq-default line-spacing .15)
  (setq show-paren-style 'expression))
