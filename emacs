
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

(eval-after-load "dired"
  '(define-key dired-mode-map "\C-xm" 'dired-w3m-find-file))

;; after installing lang/php-mode.el
(autoload 'php-mode "php-mode" "Mode for editing PHP source files")
(add-to-list 'auto-mode-alist '("\\.\\(inc\\|php[s34]?\\)" . php-mode))

;; try without colors
(global-font-lock-mode 0)

;; no tabs please
(setq-default indent-tabs-mode nil)

;; when looking at the code for a while
(setq-default blink-cursor-mode nil)

(set 'dired-copy-preserve-time "true")

;; lines always truncated
(add-hook 'js-mode-hook '(lambda() (toggle-truncate-lines 1)))
;; with angular and Yeoman two spaces is good
(add-hook 'js-mode-hook '(lambda() (set 'js-indent-level 2)))

(put 'narrow-to-region 'disabled nil)

;; one-space indentation for html tags, which have often many
;; indentation levels
(add-hook 'html-mode-hook '(lambda() (set 'c-basic-offset 1)))


(add-to-list 'auto-mode-alist '("\\.less$" . css-mode))
