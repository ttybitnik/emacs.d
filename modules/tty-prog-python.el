;;; tty-prog-python.el --- Python Programming Language -*- lexical-binding: t -*-

;;; Commentary:

;; Python-related tunings.

;;; Code:

(require 'python)

;;* Variables:

;;* Functions:

(defun company-python-mode/ttybitnik ()
  "Set up `company-mode' for `python-mode'."
  (setq-local company-minimum-prefix-length 1)
  (setq-local company-backends '((company-capf
                                  company-dabbrev-code
                                  company-keywords
                                  company-files
                                  company-yasnippet))))

;;* Main:

(setq python-shell-interpreter "python3")

;;* Bindings:

;;* Hooks:

(add-hook 'python-mode-hook (lambda ()
                              (yas-minor-mode)
                              (flymake-mode)
                              (company-mode)
                              (eglot-ensure)
                              (company-python-mode/ttybitnik)))

;;* Appearance:


(provide 'tty-prog-python)

;;; tty-prog-python.el ends here
