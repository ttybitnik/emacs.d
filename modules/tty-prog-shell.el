;;; tty-prog-shell.el --- Shell Programming Languages -*- lexical-binding: t -*-

;;; Commentary:

;; Shell-related tunings.

;;; Code:

(require 'sh-script)

;;* Variables:

;;* Functions:

(defun company-sh-mode/ttybitnik ()
  "Set up `company-mode' for `sh-mode'."
  (setq-local company-minimum-prefix-length 1)
  (setq-local company-backends '((company-capf
                                  company-dabbrev-code
                                  company-keywords
                                  company-files
                                  company-yasnippet))))

;;* Main:

;;* Bindings:

;;* Hooks:

(add-hook 'sh-mode-hook (lambda ()
                          (yas-minor-mode)
                          (flymake-mode)
                          (company-mode)
                          (eglot-ensure)
                          (company-sh-mode/ttybitnik)))

;;* Appearance:


(provide 'tty-prog-shell)

;;; tty-prog-shell.el ends here
