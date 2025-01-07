;;; tty-prog-xml.el --- eXtensible Markup Language -*- lexical-binding: t -*-

;;; Commentary:

;; XML-related tunings.

;;; Code:

(require 'nxml-mode)

;;* Variables:

;;* Functions:

;;* Main:

;;* Bindings:

;;* Hooks:

(add-hook 'nxml-mode-hook (lambda ()
                            (yas-minor-mode)
                            (flymake-mode)
                            (eglot-ensure)))

;;* Appearance:


(provide 'tty-prog-xml)

;;; tty-prog-xml.el ends here
