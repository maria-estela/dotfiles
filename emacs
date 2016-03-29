
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(dired-listing-switches "-Btrop")
 '(haskell-mode-hook
   (quote
    (turn-on-haskell-indent turn-on-haskell-indentation)) t)
 '(inhibit-startup-screen t)
 '(js2-basic-offset 2)
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

;; for Elpa

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "https://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))

;; dired

(set 'dired-copy-preserve-time "true")

;; php

(autoload 'php-mode "php-mode" "Mode for editing PHP source files")
(add-to-list 'auto-mode-alist '("\\.\\(inc\\|php[s34]?\\)" . php-mode))

;; unused javascript mode

(add-hook 'js-mode-hook '(lambda() (toggle-truncate-lines 1)))
;; with angular and Yeoman two spaces is good
(add-hook 'js-mode-hook '(lambda() (set 'js-indent-level 2)))

;; new javascript mode
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

;; markup

;; one-space indentation for html tags, which have often many
;; indentation levels
(add-hook 'html-mode-hook '(lambda() (set 'c-basic-offset 1)))

;; less

(add-to-list 'auto-mode-alist '("\\.less$" . css-mode))

;; python

;; see http://stackoverflow.com/a/4339241/393758
(defadvice python-calculate-indentation (around outdent-closing-brackets)
  "Handle lines beginning with a closing bracket and indent them so that
they line up with the line containing the corresponding opening bracket."
  (save-excursion
    (beginning-of-line)
    (let ((syntax (syntax-ppss)))
      (if (and (not (eq 'string (syntax-ppss-context syntax)))
               (python-continuation-line-p)
               (cadr syntax)
               (skip-syntax-forward "-")
               (looking-at "\\s)"))
          (progn
            (forward-char 1)
            (ignore-errors (backward-sexp))
            (setq ad-return-value (current-indentation)))
        ad-do-it))))

;; haskell
(add-hook 'haskell-mode-hook 'haskell-indentation-mode)
