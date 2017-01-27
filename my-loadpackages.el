;; ~/.emacs.d/my-loadpackages.el

(autoload 'ensure-packages "~/.emacs.d/my-packages.el" "" t)
(add-to-list 'auto-mode-alist '("ledger\.dat\\'" . ledger-mode))
(global-set-key (kbd "C-|") 'theme-looper-enable-next-theme)

(add-hook 'after-init-hook
	  (lambda()
	    (ido-vertical-mode 1)
	    (global-auto-complete-mode t)
	    (global-display-theme-mode 1)
	    (when (display-graphic-p) (beacon-mode 1))
	    ))

(with-eval-after-load "package"
  (add-to-list 'package-archives
	       '("melpa" . "http://melpa.milkbox.net/packages/") t)
  (add-to-list 'package-archives
	       '("marmalade" . "http://marmalade-repo.org/packages/") t)
  )

(with-eval-after-load "ido-vertical-mode"
  (setq ido-vertical-define-keys 'C-n-and-C-p-only)
  )

(with-eval-after-load "theme-looper"
  (theme-looper-set-theme-set
   (list 'manoj-dark 'light-blue 'organic-green 'arise 'caroline))
  )

(with-eval-after-load "rainbow-mode"
  (setq rainbow-x-colors nil)
  )
