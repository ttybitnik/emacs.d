;;; tty-prog-yaml.el --- YAML Ain't Markup Language -*- lexical-binding: t -*-

;;; Commentary:

;; YAML-related tunings.

;;; Code:

(require-package 'yaml-mode)

;;* Variables:

;;* Functions:

(defun yaml-mode/ttybitnik ()
  "Set up `yaml-mode' hooks."
  (display-line-numbers-mode)
  (fill-column/ttybitnik)
  (yas-minor-mode)
  (flymake-mode)
  (eglot-ensure))

;;* Main:

;;* Bindings:

;;* Hooks:

(add-hook 'yaml-mode-hook 'yaml-mode/ttybitnik)

;;* Appearance:


(provide 'tty-prog-yaml)

;;; tty-prog-yaml.el ends here
