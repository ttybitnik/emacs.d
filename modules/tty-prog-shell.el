;;; tty-prog-shell.el --- Shell Programming Languages -*- lexical-binding: t -*-

;;; Commentary:

;; Shell-related tunings.

;;; Code:

(require 'sh-script)
(require-package 'shfmt)

;;* Variables:

;;* Functions:

;;* Main:

;;* Bindings:

;;* Hooks:

(add-hook 'sh-mode-hook (lambda ()
                          (yas-minor-mode)
                          (flymake-mode)
			  (shfmt-on-save-mode)
                          (eglot-ensure)))

;;* Appearance:


(provide 'tty-prog-shell)

;;; tty-prog-shell.el ends here
