;;; tty-prog-json.el --- JavaScript Object Notation -*- lexical-binding: t -*-

;;; Commentary:

;; JSON-related tunings.

;;; Code:

(require-package 'json-mode)

;;* Variables:

;;* Functions:

;;* Main:

;;* Bindings:

;;* Hooks:

(add-hook 'json-mode-hook (lambda ()
                            (yas-minor-mode)
                            (flymake-mode)
                            (eglot-ensure)))

;;* Appearance:


(provide 'tty-prog-json)

;;; tty-prog-json.el ends here
