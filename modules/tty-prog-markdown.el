;;; tty-prog-markdown.el --- Markdown Markup Language -*- lexical-binding: t -*-

;;; Commentary:

;; Markdown-related tunings.

;;; Code:

(require-package 'markdown-mode)

;;* Variables:

;;* Functions:

(defun company-markdown-mode/ttybitnik ()
  "Set up `company-mode' for `markdown-mode'."
  (setq-local company-minimum-prefix-length 1)
  (setq-local company-backends '((company-capf
                                  company-dabbrev-code
                                  company-keywords
                                  company-files
                                  company-yasnippet))))

;;* Main:

;;* Bindings:

;;* Hooks:

(add-hook 'markdown-mode-hook (lambda ()
                                (yas-minor-mode)
                                (flycheck-mode)
                                (company-mode)
                                (company-markdown-mode/ttybitnik)))

;;* Appearance:


(provide 'tty-prog-markdown)

;;; tty-prog-markdown.el ends here
