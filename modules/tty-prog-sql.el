;;; tty-prog-sql.el --- Structured Query Language -*- lexical-binding: t -*-

;;; Commentary:

;; SQL-related tunings.

;;; Code:

(require 'sql)

;;* Variables:

;;* Functions:

(defun sql-mode/ttybitnik ()
  "Set up `sql-mode' hooks."
  (yas-minor-mode)
  (flymake-mode)
  (eglot-ensure))

;;* Main:

;;* Bindings:

;;* Hooks:

(add-hook 'sql-mode-hook 'sql-mode/ttybitnik)

;;* Appearance:


(provide 'tty-prog-sql)

;;; tty-prog-sql.el ends here
