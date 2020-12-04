(global-set-key (kbd "C-|") 'theme-looper-enable-next-theme)

(add-hook 'after-init-hook
	  (lambda()
	    (ido-vertical-mode 1)
	    (global-auto-complete-mode t)
	    ;; (global-display-theme-mode 1)
	    (when (display-graphic-p) (beacon-mode 1))
	    ))

(with-eval-after-load "ido-vertical-mode"
  (setq ido-vertical-define-keys 'C-n-and-C-p-only)
  )

(with-eval-after-load "theme-looper"
  (theme-looper-set-favorite-themes
   '(manoj-dark light-blue arise))
  )

(with-eval-after-load "rainbow-mode"
  (setq rainbow-x-colors nil)
  )
