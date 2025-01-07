;;; tty-prog-go.el --- Go Programming Language -*- lexical-binding: t -*-

;;; Commentary:

;; Go-related tunings.

;;; Code:

(require-package 'go-mode)

;;* Variables:

;;* Functions:

;;* Main:

(setq gofmt-command "goimports")
(setq lsp-go-analyses
      '((fieldalignment . t)
	(nilness . t)
	(shadow . t)
	(unusedwrite . t)
	(unusedparams . t)
	(unusedvariable . t)
	(useany . t)))

(add-to-list 'exec-path "~/.go/bin/")

;;* Bindings:

(define-key go-mode-map (kbd "<f6>") 'gofmt)

;;* Hooks:

(add-hook 'go-mode-hook (lambda ()
                          (yas-minor-mode)
                          (flymake-mode)
                          (eglot-ensure)
			  (add-hook 'before-save-hook 'gofmt-before-save)))

;;* Appearance:


(provide 'tty-prog-go)

;;; tty-prog-go.el ends here
