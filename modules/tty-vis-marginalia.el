;;; tty-vis-marginalia.el --- Marginalia -*- lexical-binding: t -*-

;;; Commentary:

;; Marginalia-related tunings.

;;; Code:
(require-package 'marginalia)

;;* Variables:

;;* Functions:

;;* Main:

(marginalia-mode)

;;* Bindings:

(define-key minibuffer-local-map (kbd "M-A") 'marginalia-cycle)

;;* Hooks:

;;* Appearance:


(provide 'tty-vis-marginalia)

;;; tty-vis-marginalia.el ends here
