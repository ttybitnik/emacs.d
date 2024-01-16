;;; tty-prog-javascript.el --- JavaScript Programming Language -*- lexical-binding: t -*-

;;; Commentary:

;; Javascript-related tunings.

;;; Code:

(require 'js)
(require-package 'js2-mode)

;;* Variables:

;;* Functions:

(defun company-js-mode/ttybitnik ()
  "Set up `company-mode' for `js-mode'."
  (setq-local company-minimum-prefix-length 1)
  (setq-local company-backends '((company-capf
                                  company-dabbrev-code
                                  company-keywords
                                  company-files
                                  company-yasnippet))))

;;* Main:

;;* Bindings:

;;* Hooks:

(add-hook 'js-mode-hook (lambda ()
                          (yas-minor-mode)
                          (flymake-mode)
                          (company-mode)
                          (eglot-ensure)
                          (company-js-mode/ttybitnik)))

;;* Appearance:


(provide 'tty-prog-javascript)

;;; tty-prog-javascript.el ends here
