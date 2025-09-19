;;; tty-prog-c.el --- C Programming Language -*- lexical-binding: t -*-

;;; Commentary:

;; C-related tunings.

;; Check LSP documentation for debuggers, gdb or lldb

;;; Code:

(require 'cc-mode)

;;* Variables:

;;* Functions:

(defun c-mode/ttybitnik ()
  "Set up `c-mode' hooks."
  (yas-minor-mode)
  (flymake-mode)
  (eglot-ensure)
  (c-format-on-save-mode))

;;* Main:

(reformatter-define c-format
  :program "clang-format"
  :args `(,(concat "--style=file:"
                   (expand-file-name "linux-kernel.clang-format"
                                     local-d/ttybitnik)))
  :mode t)

(setq c-default-style
      '((java-mode . "java")
		(awk-mode . "awk")
		(other . "linux")))

;;* Bindings:

;;* Hooks:

(add-hook 'c-mode-hook 'c-mode/ttybitnik)

;;* Appearance:


(provide 'tty-prog-c)

;;; tty-prog-c.el ends here
