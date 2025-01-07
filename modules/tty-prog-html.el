;;; tty-prog-html.el --- Hypertext Markup Language -*- lexical-binding: t -*-

;;; Commentary:

;; HTML-related tunings.

;;; Code:

(require 'sgml-mode)

;;* Variables:

;;* Functions:

;;* Main:

;;* Bindings:

;;* Hooks:

(add-hook 'html-mode-hook (lambda ()
                            (yas-minor-mode)
                            (flymake-mode)
                            (eglot-ensure)))

;;* Appearance:


(provide 'tty-prog-html)

;;; tty-prog-html.el ends here
