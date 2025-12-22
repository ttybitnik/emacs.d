;;; tty-prog-lisp.el --- Common Lisp Programming Language -*- lexical-binding: t -*-

;;; Commentary:

;; CL-related tunings.

;;; Code:

(require 'lisp-mode)
(require-package 'sly)

;;* Variables:

;;* Functions:

(defun lisp-mode/ttybitnik ()
  "Set up `lisp-mode' hooks."
  (yas-minor-mode)
  (flymake-mode)
  (eldoc-mode)
  (evil-cleverparens-mode))

;;* Main:

(setq inferior-lisp-program "sbcl")

(add-to-list 'sly-contribs 'sly-autodoc)
(add-to-list 'sly-contribs 'sly-fancy)

;;* Bindings:

;;* Hooks:

(add-hook 'lisp-mode-hook 'lisp-mode/ttybitnik)

;;* Appearance:


(provide 'tty-prog-lisp)

;;; tty-prog-lisp.el ends here
