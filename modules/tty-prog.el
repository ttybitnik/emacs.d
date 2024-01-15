;;; tty-prog.el --- Programming Module -*- lexical-binding: t -*-

;;; Commentary:

;; This module tailors settings and packages for programming in Emacs.

;;; Code:
;; (require 'tty-prog-lsp)

(require 'tty-prog-flycheck)
(require 'tty-prog-eglot)
(require 'tty-prog-yasnippet)

(require 'tty-prog-ansible)
(require 'tty-prog-c)
(require 'tty-prog-css)
(require 'tty-prog-go)
(require 'tty-prog-html)
(require 'tty-prog-javascript)
(require 'tty-prog-json)
(require 'tty-prog-lisp)
(require 'tty-prog-markdown)
(require 'tty-prog-python)
(require 'tty-prog-rust)
(require 'tty-prog-shell)
(require 'tty-prog-sql)
(require 'tty-prog-toml)
(require 'tty-prog-xml)
(require 'tty-prog-yaml)

;;* Variables:

;;* Functions:

(defun fill-column/ttybitnik (&optional value)
  "Set `fill-column' to VALUE or default to 80, and enable indicator."
  (setq-local fill-column (if (numberp value) value 80))
  (display-fill-column-indicator-mode))

;;* Main:

;;* Bindings:

;;* Hooks:

(add-hook 'prog-mode-hook 'fill-column/ttybitnik)
(add-hook 'conf-mode-hook 'fill-column/ttybitnik)

;;* Appearance:


(provide 'tty-prog)

;;; tty-prog.el ends here
