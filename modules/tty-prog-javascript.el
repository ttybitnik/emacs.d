;;; tty-prog-javascript.el --- JavaScript Programming Language -*- lexical-binding: t -*-

;;; Commentary:

;; Javascript-related tunings.

;;; Code:

(require 'js)
(require-package 'js2-mode)

;;* Variables:

;;* Functions:

;;* Main:

;;* Bindings:

;;* Hooks:

(add-hook 'js-mode-hook (lambda ()
                          (yas-minor-mode)
                          (flymake-mode)
                          (eglot-ensure)))

;;* Appearance:


(provide 'tty-prog-javascript)

;;; tty-prog-javascript.el ends here
