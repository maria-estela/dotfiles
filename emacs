
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(dired-listing-switches "-Btrop")
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

(defun dired-w3m-find-file ()
  (interactive)
  (require 'w3m)
  (let ((file (dired-get-filename)))
    (if (y-or-n-p (format "Use emacs-w3m to browse %s? "
                          (file-name-nondirectory file)))
        (w3m-find-file file))))

;; 18 may 2009 after installing lang/php-mode.el
(autoload 'php-mode "php-mode" "Mode for editing PHP source files")
(add-to-list 'auto-mode-alist '("\\.\\(inc\\|php[s34]?\\)" . php-mode))

;; 6 june 2009 try without colors
(global-font-lock-mode 0)

;; 9 september 2009 no tabs please
(setq-default indent-tabs-mode nil)

;; 25 september 2009 when looking to the code for a while
(setq-default blink-cursor-mode nil)

;; 14 november 2009 to help with javascript protovis
;;(autoload 'js2-mode "js2" nil t)
;;(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

;; 11 dicember 2009
(set 'dired-copy-preserve-time "true")

;; 2 june 2010 writing in javascript, I want a two-space indentation
;; and lines always truncated
(add-hook 'c-mode-common-hook '(lambda() (toggle-truncate-lines 1)))
(add-hook 'c-mode-common-hook '(lambda() (set 'c-basic-offset 4)))

(put 'narrow-to-region 'disabled nil)

;; 10 september 2010 one-space indentation for html tags, which have
;; often many indentation levels
(add-hook 'html-mode-hook '(lambda() (set 'c-basic-offset 1)))

;; from now on it's versioned, not adding timestamps
(add-hook 'javascript-mode-hook '(lambda() (toggle-truncate-lines 1)))
