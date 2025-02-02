;;; tty-prog-lisp.el --- List Processing Programming Languages -*- lexical-binding: t -*-

;;; Commentary:

;; LISP-related tunings.

;;; Code:

(require 'lisp-mode)
(require-package 'sly)

;;* Variables:

;;* Functions:

(defun emacs-lisp-mode/ttybitnik ()
  "Set up `emacs-lisp-mode' hooks."
  (yas-minor-mode)
  (flymake-mode)
  (eldoc-mode))

;;* Main:

(setq inferior-lisp-program "sbcl")

(add-to-list 'sly-contribs 'sly-autodoc)
(add-to-list 'sly-contribs 'sly-fancy)

;;* Bindings:

;;* Hooks:

(add-hook 'emacs-lisp-mode-hook  'emacs-lisp-mode/ttybitnik)

;;* Appearance:


(provide 'tty-prog-lisp)

;;; tty-prog-lisp.el ends here
