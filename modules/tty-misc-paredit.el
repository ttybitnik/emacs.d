;;; tty-misc-paredit.el --- Parenthetical Editing -*- lexical-binding: t -*-

;;; Commentary:

;; Paredit-related tunings.

;; See `paredit.el' for more info.

;;; Code:

(require-package 'paredit)

;;* Variables:

;;* Functions:

;;* Main:

;;* Bindings:

;;* Hooks:

(add-hook 'prog-mode-hook 'enable-paredit-mode)
;; (add-hook 'lisp-mode-hook 'enable-paredit-mode)
;; (add-hook 'emacs-lisp-mode-hook 'enable-paredit-mode)
;; (add-hook 'scheme-mode-hook 'enable-paredit-mode)

;;* Appearance:


(provide 'tty-misc-paredit)

;;; tty-misc-paredit.el ends here
