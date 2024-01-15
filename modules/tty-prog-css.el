;;; tty-prog-css.el --- Cascading Style Sheets Language -*- lexical-binding: t -*-

;;; Commentary:

;; CSS-related tunings.

;;; Code:

(require 'css-mode)

;;* Variables:

;;* Functions:

(defun company-css-mode/ttybitnik ()
  "Set up `company-mode' for `css-mode'."
  (setq-local company-minimum-prefix-length 1)
  (setq-local company-backends '((company-capf
                                  company-dabbrev-code
                                  company-keywords
                                  company-files
                                  company-yasnippet))))

;;* Main:

;;* Bindings:

;;* Hooks:

(add-hook 'css-mode-hook (lambda ()
                           (yas-minor-mode)
                           (flycheck-mode)
                           (company-mode)
                           (eglot-ensure)
                           (company-css-mode/ttybitnik)))

;;* Appearance:


(provide 'tty-prog-css)

;;; tty-prog-css.el ends here
