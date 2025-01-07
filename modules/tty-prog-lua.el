;;; tty-prog-lua.el --- Lua Programming Language -*- lexical-binding: t -*-

;;; Commentary:

;; Lua-related tunings.

;;; Code:

(require-package 'lua-mode)

;;* Variables:

;;* Functions:

;;* Main:

;;* Bindings:

;;* Hooks:

(add-hook 'lua-mode-hook (lambda ()
                          (yas-minor-mode)
                          (flymake-mode)
                          (eglot-ensure)))

;;* Appearance:


(provide 'tty-prog-lua)

;;; tty-prog-lua.el ends here
