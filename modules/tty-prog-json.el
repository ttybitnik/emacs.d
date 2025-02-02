;;; tty-prog-json.el --- JavaScript Object Notation -*- lexical-binding: t -*-

;;; Commentary:

;; JSON-related tunings.

;;; Code:

(require-package 'json-mode)

;;* Variables:

;;* Functions:

(defun json-mode/ttybitnik ()
  "Set up `json-mode' hooks."
  (yas-minor-mode)
  (flymake-mode)
  (eglot-ensure))

;;* Main:

;;* Bindings:

;;* Hooks:

(add-hook 'json-mode-hook 'json-mode/ttybitnik)

;;* Appearance:


(provide 'tty-prog-json)

;;; tty-prog-json.el ends here
