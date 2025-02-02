;;; tty-prog-python.el --- Python Programming Language -*- lexical-binding: t -*-

;;; Commentary:

;; Python-related tunings.

;;; Code:

(require 'python)

;;* Variables:

;;* Functions:

(defun python-mode/ttybitnik ()
  "Set up `python-mode' hooks."
  (yas-minor-mode)
  (flymake-mode)
  (eglot-ensure))

;;* Main:

(setq python-shell-interpreter "python3")

;;* Bindings:

;;* Hooks:

(add-hook 'python-mode-hook 'python-mode/ttybitnik)

;;* Appearance:


(provide 'tty-prog-python)

;;; tty-prog-python.el ends here
