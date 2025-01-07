;;; tty-prog-lisp.el --- List Processing Programming Languages -*- lexical-binding: t -*-

;;; Commentary:

;; LISP-related tunings.

;;; Code:

(require 'lisp-mode)
(require-package 'sly)

;;* Variables:

;;* Functions:

;;* Main:

(setq inferior-lisp-program "sbcl")

(add-to-list 'sly-contribs 'sly-autodoc)
(add-to-list 'sly-contribs 'sly-fancy)

;;* Bindings:

;;* Hooks:

(add-hook 'emacs-lisp-mode-hook (lambda ()
                                  (yas-minor-mode)
                                  (flymake-mode)
				  (eldoc-mode)))

;;* Appearance:


(provide 'tty-prog-lisp)

;;; tty-prog-lisp.el ends here
