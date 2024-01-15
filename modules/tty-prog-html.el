;;; tty-prog-html.el --- Hypertext Markup Language -*- lexical-binding: t -*-

;;; Commentary:

;; HTML-related tunings.

;;; Code:

(require 'sgml-mode)

;;* Variables:

;;* Functions:

(defun company-html-mode/ttybitnik ()
  "Set up `company-mode' for `html-mode'."
  (setq-local company-minimum-prefix-length 1)
  (setq-local company-backends '((company-capf
                                  company-dabbrev-code
                                  company-keywords
                                  company-files
                                  company-yasnippet))))

;;* Main:

;;* Bindings:

;;* Hooks:

(add-hook 'html-mode-hook (lambda ()
                            (yas-minor-mode)
                            (flycheck-mode)
                            (company-mode)
                            (eglot-ensure)
                            (company-html-mode/ttybitnik)))

;;* Appearance:


(provide 'tty-prog-html)

;;; tty-prog-html.el ends here
