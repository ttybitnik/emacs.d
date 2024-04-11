;;; tty-prog-json.el --- JavaScript Object Notation -*- lexical-binding: t -*-

;;; Commentary:

;; JSON-related tunings.

;;; Code:

(require-package 'json-mode)

;;* Variables:

;;* Functions:

(defun company-json-mode/ttybitnik ()
  "Set up `company-mode' for `json-mode'."
  (setq-local company-minimum-prefix-length 1)
  (setq-local company-backends '((company-capf
                                  company-dabbrev-code
                                  company-keywords
                                  company-files
                                  company-yasnippet))))

;;* Main:

;;* Bindings:

;;* Hooks:

(add-hook 'json-mode-hook (lambda ()
                            (yas-minor-mode)
                            (flymake-mode)
                            (company-mode)
                            (eglot-ensure)
                            (company-yaml-mode/ttybitnik)))

;;* Appearance:


(provide 'tty-prog-json)

;;; tty-prog-json.el ends here
