;;; tty-prog-flycheck.el --- Flycheck Syntax -*- lexical-binding: t -*-

;;; Commentary:

;; Flycheck-related tunings.

;; DEPRECATED 2024-01-16: I've switched to built-in `flymake' since `eglot'
;; basically only supports it.

;;; Code:

;; (require-package 'flycheck)

;;* Variables:

;;* Functions:

;;* Main:

(setq flycheck-idle-change-delay 2)

;;* Bindings:

;;* Hooks:

;;* Appearance:

(diminish 'flycheck-mode)


(provide 'tty-prog-flycheck)

;;; tty-prog-flycheck.el ends here
