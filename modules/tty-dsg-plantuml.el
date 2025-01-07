;;; tty-dsg-plantuml.el --- Plant Unified Modeling Language -*- lexical-binding: t -*-

;;; Commentary:

;; Plantuml-related tunings.

;;; Code:

(require-package 'plantuml-mode)

;;* Variables:

;;* Functions:

;;* Main:

(setq plantuml-default-exec-mode 'executable)

;;* Bindings:

;;* Hooks:

(add-hook 'plantuml-mode-hook (lambda ()
                                (yas-minor-mode)
                                (flymake-mode)))

;;* Appearance:


(provide 'tty-dsg-plantuml)

;;; tty-dsg-plantuml.el ends here
