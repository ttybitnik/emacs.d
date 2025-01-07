;;; tty-prog-c.el --- C Programming Language -*- lexical-binding: t -*-

;;; Commentary:

;; C-related tunings.

;; Check LSP documentation for debuggers, gdb or lldb

;;; Code:

(require 'cc-mode)

;;* Variables:

;;* Functions:

;;* Main:

(setq c-default-style '((java-mode . "java")
			(awk-mode . "awk")
			(other . "linux")))

;;* Bindings:

;;* Hooks:

(add-hook 'c-mode-hook (lambda ()
                         (yas-minor-mode)
                         (flymake-mode)
                         (eglot-ensure)))

;;* Appearance:


(provide 'tty-prog-c)

;;; tty-prog-c.el ends here
