
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(dired-listing-switches "-Btrop")
 '(haskell-mode-hook (quote (turn-on-haskell-indent turn-on-haskell-indentation)))
 '(inhibit-startup-screen t)
 '(make-backup-files nil)
 '(standard-indent 2))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; global

(global-font-lock-mode 0)
(setq-default indent-tabs-mode nil)
(setq-default blink-cursor-mode nil)

;; dired

(set 'dired-copy-preserve-time "true")

;; php

(autoload 'php-mode "php-mode" "Mode for editing PHP source files")
(add-to-list 'auto-mode-alist '("\\.\\(inc\\|php[s34]?\\)" . php-mode))

;; javascript

(add-hook 'js-mode-hook '(lambda() (toggle-truncate-lines 1)))
;; with angular and Yeoman two spaces is good
(add-hook 'js-mode-hook '(lambda() (set 'js-indent-level 2)))

;; markup

;; one-space indentation for html tags, which have often many
;; indentation levels
(add-hook 'html-mode-hook '(lambda() (set 'c-basic-offset 1)))

;; less

(add-to-list 'auto-mode-alist '("\\.less$" . css-mode))
