;;; tty-prog-css.el --- Cascading Style Sheets Language -*- lexical-binding: t -*-

;;; Commentary:

;; CSS-related tunings.

;;; Code:

(require 'css-mode)

;;* Variables:

;;* Functions:

(defun css-mode/ttybitnik ()
  "Set up `css-mode' hooks."
  (yas-minor-mode)
  (flymake-mode)
  (eglot-ensure))

;;* Main:

;;* Bindings:

;;* Hooks:

(add-hook 'css-mode-hook 'css-mode/ttybitnik)

;;* Appearance:


(provide 'tty-prog-css)

;;; tty-prog-css.el ends here
