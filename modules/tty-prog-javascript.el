;;; tty-prog-javascript.el --- JavaScript Programming Language -*- lexical-binding: t -*-

;;; Commentary:

;; Javascript-related tunings.

;;; Code:

(require 'js)
(require-package 'js2-mode)

;;* Variables:

;;* Functions:
(defun js-mode/ttybitnik ()
  "Set up `js-mode' hooks."
  (yas-minor-mode)
  (flymake-mode)
  (eglot-ensure))

;;* Main:

;; (setq js-indent-level 2)

;;* Bindings:

;;* Hooks:

(add-hook 'js-mode-hook 'js-mode/ttybitnik)

;;* Appearance:


(provide 'tty-prog-javascript)

;;; tty-prog-javascript.el ends here
