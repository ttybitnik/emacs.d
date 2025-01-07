;;; tty-prog-markdown.el --- Markdown Markup Language -*- lexical-binding: t -*-

;;; Commentary:

;; Markdown-related tunings.

;;; Code:

(require-package 'markdown-mode)

;;* Variables:

;;* Functions:

;;* Main:

;;* Bindings:

(define-key markdown-mode-map (kbd "M-p") nil)
(define-key markdown-mode-map (kbd "M-n") nil)

;;* Hooks:

(add-hook 'markdown-mode-hook (lambda ()
                                (yas-minor-mode)
                                (flymake-mode)))

;;* Appearance:


(provide 'tty-prog-markdown)

;;; tty-prog-markdown.el ends here
