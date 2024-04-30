;;; tty-prog-scheme.el --- Scheme Programming Language -*- lexical-binding: t -*-

;;; Commentary:

;; Scheme-related tunings.

;;; Code:

(require 'scheme)
(require-package 'geiser)
(require-package 'geiser-guile)

;;* Variables:

;;* Functions:

(defun company-scheme-mode/ttybitnik ()
  "Set up `company-mode' for `scheme-mode'."
  (setq-local company-minimum-prefix-length 1)
  (setq-local company-backends '((company-capf
                                  company-dabbrev-code
                                  company-keywords
                                  company-files
                                  company-yasnippet))))

;;* Main:

(setq geiser-guile-binary "guile3.0")

;;* Bindings:

;;* Hooks:

(add-hook 'scheme-mode-hook (lambda ()
                                  (yas-minor-mode)
                                  (flymake-mode)
                                  (company-mode)
                                  (company-scheme-mode/ttybitnik)
                                  (eldoc-mode)))

;;* Appearance:


(provide 'tty-prog-scheme)

;;; tty-prog-scheme.el ends here
