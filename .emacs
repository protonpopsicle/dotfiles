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
;;(add-hook 'before-save-hook 'delete-trailing-whitespace)

(add-hook 'prog-mode-hook 'show-paren-mode)

;;(require 'rainbow-delimiters)
;;(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
;; (require 'highlight-symbol)
;; (global-set-key (kbd "C-c C-e") 'highlight-symbol-at-point)

(setq vc-handled-backends ()) ;; disable vc

;; org
;; (add-to-list 'auto-mode-alist '("\\.txt\\'" . org-mode))
(setq org-directory "~/Dropbox/org/")
;; (setq org-startup-indented t)
(setq org-log-done 'time)
(setq org-todo-keywords '("NEXT" "WAITING" "SOMEDAY" "DONE"))
(add-hook 'org-mode-hook (lambda () (visual-line-mode 1)))

;; org agenda
(define-key global-map (kbd "C-c a") 'org-agenda)
(setq org-agenda-files (list
                        (concat org-directory "organizer.org")))
                        ;; (concat org-directory "somday.org")))
(setq org-agenda-custom-commands '(("n" todo "NEXT")))
(setq org-agenda-prefix-format
      " %-28(concat (car (last (org-get-outline-path))) \":\")")

;; org capture
(setq org-capture-templates
      '(("i" "Inbox" entry
	 (file+headline (concat org-directory "organizer.org") "Inbox")
         "* NEXT %?")))

(define-key global-map "\C-cc"
        (lambda () (interactive) (org-capture nil "i")))

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

(setenv "PATH" (concat (getenv "PATH") ":/usr/texbin:/usr/local/git/bin: \
/usr/local/bin:/usr/local/sbin"))
(add-to-list 'exec-path "/usr/local/bin")
(add-to-list 'exec-path "/usr/texbin")

(global-auto-revert-mode 1)

(global-set-key (kbd "C-x C-b") 'ibuffer)

(ido-mode t)
(require 'ido-vertical-mode)
(ido-vertical-mode 1)

;; (require 'flx-ido)
;; (flx-ido-mode 1)

(require 'auto-complete)
(global-auto-complete-mode t)

;; mode line settings
(line-number-mode t)
(column-number-mode t)

;; gui
(set-fringe-mode 4)
(scroll-bar-mode -1)
;;(add-to-list 'default-frame-alist '(font . "Ubuntu Mono-11"))
(add-to-list 'default-frame-alist '(width . 85))
(add-to-list 'default-frame-alist '(height . 40))
(setq-default line-spacing .15)
(tool-bar-mode -1)

(defun setup-gui ()
  ;; (require 'moe-theme)
  ;;(setq moe-theme-highlight-buffer-id nil)
  ;; (moe-light)
  ;;(moe-theme-set-color 'red)
  ;; (Available colors: blue, orange, green ,magenta, yellow, purple, red, cyan, w/b.)
  ;;(moe-theme-random-color)
  (load-theme 'dakrone t)
  (require 'display-theme)
  (global-display-theme-mode 1)
  (require 'theme-looper)
  (theme-looper-set-theme-set (list 'dakrone 'dark-krystal 'darktooth 'warm-night 'gruvbox 'hemisu-dark))
  (global-set-key (kbd "C-|") 'theme-looper-enable-next-theme)
  (global-set-key (kbd "C-\\") 'theme-looper-enable-random-theme)
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

;;(require 'markdown-mode)
;;(add-hook 'markdown-mode-hook (lambda () (visual-line-mode 1)))

;;(require 'yaml-mode)

;;(require 'automargin)
;;(setq automargin-target-width 100)

(require 'uniquify) ; bundled with GNU emacs 23.2.1 or before. On in 24.4
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#3C3836" "#FB4934" "#B8BB26" "#FABD2F" "#83A598" "#D3869B" "#8EC07C" "#EBDBB2"])
 '(custom-safe-themes
   (quote
    ("52706f54fd3e769a0895d1786796450081b994378901d9c3fb032d3094788337" "c158c2a9f1c5fcf27598d313eec9f9dceadf131ccd10abc6448004b14984767c" "7feeed063855b06836e0262f77f5c6d3f415159a98a9676d549bfeb6c49637c4" "357d5abe6f693f2875bb3113f5c031b7031f21717e8078f90d9d9bc3a14bcbd8" "ba9be9caf9aa91eb34cf11ad9e8c61e54db68d2d474f99a52ba7e87097fa27f5" "2258c76e10cd14e83f842cd83735b2ad4cbadd7a62ac4b4792fa61b104517ea0" "13590cc9554286c8e893463fd8e0dad7134d6b7db10060afbb6850db3e395f17" "a3132bd39a977ddde4c002f8bd0ef181414c3fbe9228e3643b999491192680ad" "f1af57ed9c239a5db90a312de03741e703f712355417662c18e3f66787f94cbe" "ac5584b12254623419499c3a7a5388031a29be85a15fdef9b94df2292d3e2cbb" default)))
 '(fci-rule-color "#444444")
 '(pos-tip-background-color "#36473A")
 '(pos-tip-foreground-color "#FFFFC8"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

