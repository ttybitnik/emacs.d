;;; tty-prog-html.el --- Hypertext Markup Language -*- lexical-binding: t -*-

;;; Commentary:

;; HTML-related tunings.

;;; Code:

(require 'sgml-mode)

;;* Variables:

;;* Functions:

(defun html-mode/ttybitnik ()
  "Set up `html-mode' hooks."
  (yas-minor-mode)
  (flymake-mode)
  (eglot-ensure))

;;* Main:

;;* Bindings:

;;* Hooks:

(add-hook 'html-mode-hook 'html-mode/ttybitnik)

;;* Appearance:


(provide 'tty-prog-html)

;;; tty-prog-html.el ends here
