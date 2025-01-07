;;; tty-prog-sql.el --- Structured Query Language -*- lexical-binding: t -*-

;;; Commentary:

;; SQL-related tunings.

;;; Code:

(require 'sql)

;;* Variables:

;;* Functions:

;;* Main:

;;* Bindings:

;;* Hooks:

(add-hook 'sql-mode-hook (lambda ()
                           (yas-minor-mode)
                           (flymake-mode)
                           (eglot-ensure)))

;;* Appearance:


(provide 'tty-prog-sql)

;;; tty-prog-sql.el ends here
