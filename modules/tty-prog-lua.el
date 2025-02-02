;;; tty-prog-lua.el --- Lua Programming Language -*- lexical-binding: t -*-

;;; Commentary:

;; Lua-related tunings.

;;; Code:

(require-package 'lua-mode)

;;* Variables:

;;* Functions:

(defun lua-mode/ttybitnik ()
  "Set up `lua-mode' hooks."
  (yas-minor-mode)
  (flymake-mode)
  (eglot-ensure))

;;* Main:

;;* Bindings:

;;* Hooks:

(add-hook 'lua-mode-hook 'lua-mode/ttybitnik)

;;* Appearance:


(provide 'tty-prog-lua)

;;; tty-prog-lua.el ends here
