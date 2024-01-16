;;; tty-prog-c.el --- C Programming Language -*- lexical-binding: t -*-

;;; Commentary:

;; C-related tunings.

;; Check LSP documentation for debuggers, gdb or lldb

;;; Code:

(require 'cc-mode)

;;* Variables:

;;* Functions:

(defun company-c-mode/ttybitnik ()
  "Set up `company-mode' for `c-mode'."
  (setq-local company-minimum-prefix-length 1)
  (setq-local company-backends '((company-capf
                                  company-dabbrev-code
                                  company-keywords
                                  company-files
                                  company-yasnippet))))

;;* Main:

(setq c-default-style '((java-mode . "java")
			(awk-mode . "awk")
			(other . "linux")))

;;* Bindings:

;;* Hooks:

(add-hook 'c-mode-hook (lambda ()
                         (yas-minor-mode)
                         (flymake-mode)
                         (company-mode)
                         (eglot-ensure)
                         (company-c-mode/ttybitnik)))

;;* Appearance:


(provide 'tty-prog-c)

;;; tty-prog-c.el ends here
