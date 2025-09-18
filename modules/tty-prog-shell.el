;;; tty-prog-shell.el --- Shell Programming Languages -*- lexical-binding: t -*-

;;; Commentary:

;; Shell-related tunings.

;;; Code:

(require 'sh-script)
(require-package 'shfmt)

;;* Variables:

;;* Functions:

(defun sh-mode/ttybitnik ()
  "Set up `sh-mode' hooks."
  (yas-minor-mode)
  (flymake-mode)
  (shfmt-on-save-mode)
  (eglot-ensure))

;;* Main:

(setq shfmt-arguments '("--func-next-line"
			"--binary-next-line"
			"--case-indent"
			"--keep-padding"))

(setq shfmt-respect-sh-basic-offset t)

;;* Bindings:

;;* Hooks:

(add-hook 'sh-mode-hook 'sh-mode/ttybitnik)

;;* Appearance:


(provide 'tty-prog-shell)

;;; tty-prog-shell.el ends here
