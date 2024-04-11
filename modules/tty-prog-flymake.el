;;; tty-prog-flymake.el --- Flymake -*- lexical-binding: t -*-

;;; Commentary:

;; Flymake-related tunings.

;;; Code:

(require-package 'flymake)

;;* Variables:

;;* Functions:

;;* Main:

;;* Bindings:

;;* Hooks:

(add-hook 'prog-mode-hook 'flymake-mode)
;; (add-hook 'text-mode-hook 'flymake-mode)

;;* Appearance:


(provide 'tty-prog-flymake)

;;; tty-prog-flymake.el ends here
