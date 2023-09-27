;;; tty-prog-sql.el --- Structured Query Language -*- lexical-binding: t -*-

;;; Commentary:

;; SQL-related tunings.

;;; Code:

(require 'sql)

;;* Variables:

;;* Functions:

(defun company-sql-mode/ttybitnik ()
  "Set up `company-mode' for `sql-mode'."
  (setq-local company-minimum-prefix-length 1)
  (setq-local company-backends '((company-capf
                                  company-dabbrev-code
                                  company-keywords
                                  company-files
                                  company-yasnippet))))

;;* Main:

;;* Bindings:

;;* Hooks:

(add-hook 'sql-mode-hook (lambda ()
                           (yas-minor-mode)
                           (flycheck-mode)
                           (company-mode)
                           (lsp-deferred)
                           (company-sql-mode/ttybitnik)))

;;* Appearance:


(provide 'tty-prog-sql)

;;; tty-prog-sql.el ends here
