;;; tty-prog-yaml.el --- YAML Ain't Markup Language -*- lexical-binding: t -*-

;;; Commentary:

;; YAML-related tunings.

;;; Code:

(require-package 'yaml-mode)

;;* Variables:

;;* Functions:

(defun company-yaml-mode/ttybitnik ()
  "Set up `company-mode' for `yaml-mode'."
  (setq-local company-minimum-prefix-length 1)
  (setq-local company-backends '((company-capf
                                  company-dabbrev-code
                                  company-keywords
                                  company-files
                                  company-yasnippet))))

;;* Main:

;;* Bindings:

;;* Hooks:

(add-hook 'yaml-mode-hook (lambda ()
                            (yas-minor-mode)
                            (flymake-mode)
                            (company-mode)
                            (eglot-ensure)
                            (company-yaml-mode/ttybitnik)))

;;* Appearance:


(provide 'tty-prog-yaml)

;;; tty-prog-yaml.el ends here
