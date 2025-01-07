;;; tty-prog-python.el --- Python Programming Language -*- lexical-binding: t -*-

;;; Commentary:

;; Python-related tunings.

;;; Code:

(require 'python)

;;* Variables:

;;* Functions:

;;* Main:

(setq python-shell-interpreter "python3")

;;* Bindings:

;;* Hooks:

(add-hook 'python-mode-hook (lambda ()
                              (yas-minor-mode)
                              (flymake-mode)
                              (eglot-ensure)))

;;* Appearance:


(provide 'tty-prog-python)

;;; tty-prog-python.el ends here
