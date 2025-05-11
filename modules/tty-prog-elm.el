;;; tty-prog-elm.el --- Elm Programming Language -*- lexical-binding: t -*-

;;; Commentary:

;; Elm-related tunings.

;;; Code:

(require-package 'elm-mode)

;;* Variables:

;;* Functions:

(defun elm-mode/ttybitnik ()
  "Set up `elm-mode' hooks."
  (yas-minor-mode)
  (flymake-mode)
  (eglot-ensure)
  (elm-format-on-save-mode))

;;* Main:

;;* Bindings:

;;* Hooks:

(add-hook 'elm-mode-hook 'elm-mode/ttybitnik)

;;* Appearance:


(provide 'tty-prog-elm)

;;; tty-prog-elm.el ends here
