;;; tty-prog-xml.el --- eXtensible Markup Language -*- lexical-binding: t -*-

;;; Commentary:

;; XML-related tunings.

;;; Code:

(require 'nxml-mode)

;;* Variables:

;;* Functions:

(defun company-nxml-mode/ttybitnik ()
  "Set up `company-mode' for `nxml-mode'."
  (setq-local company-minimum-prefix-length 1)
  (setq-local company-backends '((company-capf
                                  company-dabbrev-code
                                  company-keywords
                                  company-files
                                  company-yasnippet))))

;;* Main:

;;* Bindings:

;;* Hooks:

(add-hook 'nxml-mode-hook (lambda ()
                            (yas-minor-mode)
                            (flycheck-mode)
                            (company-mode)
                            (lsp-deferred)
                            (company-nxml-mode/ttybitnik)))

;;* Appearance:


(provide 'tty-prog-xml)

;;; tty-prog-xml.el ends here
