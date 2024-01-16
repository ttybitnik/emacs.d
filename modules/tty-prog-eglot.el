;;; tty-prog-eglot.el --- Emacs Polyglot -*- lexical-binding: t -*-

;;; Commentary:

;; Eglot-related tunings.

;;; Code:

(require-package 'eglot)

;;* Variables:

;;* Functions:

;;* Main:

(setq eglot-autoshutdown t)

(setq eldoc-echo-area-use-multiline-p nil)

;;* Bindings:

(define-key eglot-mode-map (kbd "C-c s a") 'eglot-code-actions)
(define-key eglot-mode-map (kbd "C-c s i") 'imenu)
(define-key eglot-mode-map (kbd "C-c s r") 'eglot-rename)
(define-key eglot-mode-map (kbd "C-c s f") 'eglot-format-buffer)
(define-key eglot-mode-map (kbd "C-c s o") 'eglot-code-action-organize-imports)
(define-key eglot-mode-map (kbd "C-c s h") 'eldoc)

;;* Hooks:

;;* Appearance:


(provide 'tty-prog-eglot)

;;; tty-prog-eglot.el ends here
