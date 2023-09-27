;;; tty-prog-go.el --- Go Programming Language -*- lexical-binding: t -*-

;;; Commentary:

;; Go-related tunings.

;;; Code:

(require-package 'go-mode)
(require 'lsp-go)

;;* Variables:

;;* Functions:

(defun company-go-mode/ttybitnik ()
  "Set up `company-mode' for `go-mode'."
  (setq-local company-minimum-prefix-length 1)
  (setq-local company-backends '((company-capf
                                  company-dabbrev-code
                                  company-keywords
                                  company-files
                                  company-yasnippet))))

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
                          (flycheck-mode)
                          (company-mode)
                          (lsp-deferred)
                          (company-go-mode/ttybitnik)))

;;* Appearance:


(provide 'tty-prog-go)

;;; tty-prog-go.el ends here
