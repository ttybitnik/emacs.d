;;; tty-prog-xml.el --- eXtensible Markup Language -*- lexical-binding: t -*-

;;; Commentary:

;; XML-related tunings.

;;; Code:

(require 'nxml-mode)

;;* Variables:

;;* Functions:

(defun nxml-mode/ttybitnik ()
  "Set up `nxml-mode' hooks."
  (yas-minor-mode)
  (flymake-mode)
  (eglot-ensure))

;;* Main:

;;* Bindings:

;;* Hooks:

(add-hook 'nxml-mode-hook 'nxml-mode/ttybitnik)

;;* Appearance:


(provide 'tty-prog-xml)

;;; tty-prog-xml.el ends here
