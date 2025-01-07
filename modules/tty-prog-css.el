;;; tty-prog-css.el --- Cascading Style Sheets Language -*- lexical-binding: t -*-

;;; Commentary:

;; CSS-related tunings.

;;; Code:

(require 'css-mode)

;;* Variables:

;;* Functions:

;;* Main:

;;* Bindings:

;;* Hooks:

(add-hook 'css-mode-hook (lambda ()
                           (yas-minor-mode)
                           (flymake-mode)
                           (eglot-ensure)))

;;* Appearance:


(provide 'tty-prog-css)

;;; tty-prog-css.el ends here
