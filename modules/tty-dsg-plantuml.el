;;; tty-dsg-plantuml.el --- Plant Unified Modeling Language -*- lexical-binding: t -*-

;;; Commentary:

;; Plantuml-related tunings.

;;; Code:

(require-package 'plantuml-mode)

;;* Variables:

;;* Functions:

(defun company-plantuml-mode/ttybitnik ()
  "Set up `company-mode' for `plantuml-mode'."
  (setq-local company-minimum-prefix-length 1)
  (setq-local company-backends '((company-capf
                                  company-dabbrev-code
                                  company-keywords
                                  company-files
                                  company-yasnippet))))

;;* Main:

(setq plantuml-default-exec-mode 'executable)

;;* Bindings:

;;* Hooks:

(add-hook 'plantuml-mode-hook (lambda ()
                                (yas-minor-mode)
                                (flycheck-mode)
                                (company-mode)
                                (company-plantuml-mode/ttybitnik)))

;;* Appearance:


(provide 'tty-dsg-plantuml)

;;; tty-dsg-plantuml.el ends here
