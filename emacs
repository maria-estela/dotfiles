
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(custom-enabled-themes (quote (deeper-blue)))
 '(dired-listing-switches "-Btop")
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

;; bind C-c t to `helm-projectile`
(global-set-key [3 116] (quote helm-projectile))

;; this is terrible code
(defun set-margins-my () (interactive 
       ;; http://superuser.com/a/645114/255836
       (setq-default left-margin-width 60 right-margin-width 60) ; Define new widths.
       (set-window-buffer nil (current-buffer)) ; Use them now.
       ;; the following would work by itself, but would be ignored
       ;; here because of exceptions on the lines above
       ;(set-frame-parameter nil 'internal-border-width 40)
))
(defun set-margins-none () (interactive 
       (setq-default left-margin-width 0 right-margin-width 0) ; Define new widths.
       (set-window-buffer nil (current-buffer)) ; Use them now.
))

;; always disable the change log mode
(rassq-delete-all 'change-log-mode auto-mode-alist)

;; expand-region
(global-set-key (kbd "C-=") 'er/expand-region)

;; set temporary file directory in order to avoid cluttering the file
;; system with temporary files https://www.emacswiki.org/emacs/AutoSave#toc1
(setq backup-directory-alist
`((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
`((".*" ,temporary-file-directory t)))
(put 'dired-find-alternate-file 'disabled nil)

;; automatically revert files
(global-auto-revert-mode 1)