;;; tty-prog-markdown.el --- Markdown Markup Language -*- lexical-binding: t -*-

;;; Commentary:

;; Markdown-related tunings.

;;; Code:

(require-package 'markdown-mode)

;;* Variables:

;;* Functions:

(defun markdown-mode/ttybitnik ()
  "Set up `markdown-mode' hooks."
  (yas-minor-mode)
  (flymake-mode))

;;* Main:

;;* Bindings:

(define-key markdown-mode-map (kbd "M-p") nil)
(define-key markdown-mode-map (kbd "M-n") nil)

;;* Hooks:

(add-hook 'markdown-mode-hook 'markdown-mode/ttybitnik)

;;* Appearance:


(provide 'tty-prog-markdown)

;;; tty-prog-markdown.el ends here
