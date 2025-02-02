;;; tty-dsg-plantuml.el --- Plant Unified Modeling Language -*- lexical-binding: t -*-

;;; Commentary:

;; Plantuml-related tunings.

;;; Code:

(require-package 'plantuml-mode)

;;* Variables:

;;* Functions:

(defun plantuml-mode/ttybitnik ()
  "Set up `plantuml-mode' hooks."
  (yas-minor-mode)
  (flymake-mode))

;;* Main:

(setq plantuml-default-exec-mode 'executable)

;;* Bindings:

;;* Hooks:

(add-hook 'plantuml-mode-hook 'plantuml-mode/ttybitnik)

;;* Appearance:


(provide 'tty-dsg-plantuml)

;;; tty-dsg-plantuml.el ends here
