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
  (eglot-ensure)
  (python-format-on-save-mode))

;;* Main:

(reformatter-define python-format
  :program "black"
  :args '("-")
  :mode t)

(setq python-shell-interpreter "python3")

;;* Bindings:

;;* Hooks:

(add-hook 'python-mode-hook 'python-mode/ttybitnik)

;;* Appearance:


(provide 'tty-prog-python)

;;; tty-prog-python.el ends here
