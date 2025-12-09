;;; tty-prog-html.el --- Hypertext Markup Language -*- lexical-binding: t -*-

;;; Commentary:

;; HTML-related tunings.

;;; Code:

(require 'sgml-mode)
(require-package 'emmet-mode)

;;* Variables:

;;* Functions:

(defun html-mode/ttybitnik ()
  "Set up `html-mode' hooks."
  (yas-minor-mode)
  (flymake-mode)
  (emmet-mode)
  (eglot-ensure))

;;* Main:

;;* Bindings:

;; Prevent conflict with `paredit-mode'.
(define-key emmet-mode-keymap (kbd "C-j") nil)
(define-key emmet-mode-keymap (kbd "C-c C-c j") 'emmet-expand-line)

(define-key emmet-mode-keymap (kbd "C-c C-c w") 'emmet-wrap-with-markup)
(define-key emmet-mode-keymap (kbd "<C-return>") 'emmet-expand-line)
(define-key emmet-mode-keymap (kbd "<C-M-right>") 'emmet-next-edit-point)
(define-key emmet-mode-keymap (kbd "<C-M-left>") 'emmet-prev-edit-point)

;;* Hooks:

(add-hook 'html-mode-hook 'html-mode/ttybitnik)
(add-hook 'sgml-mode-hook 'emmet-mode)
(add-hook 'css-mode-hook  'emmet-mode)

;;* Appearance:


(provide 'tty-prog-html)

;;; tty-prog-html.el ends here
