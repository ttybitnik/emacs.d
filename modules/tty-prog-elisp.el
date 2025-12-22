;;; tty-prog-elisp.el --- Emacs Lisp Programming Language -*- lexical-binding: t -*-

;;; Commentary:

;; Elisp-related tunings.

;;; Code:

(require 'elisp-mode)
(require-package 'package-lint)

;;* Variables:

;;* Functions:

(defun emacs-lisp-mode/ttybitnik ()
  "Set up `emacs-lisp-mode' hooks."
  (yas-minor-mode)
  (flymake-mode)
  (eldoc-mode)
  (evil-cleverparens-mode))

;;* Main:

;;* Bindings:

;;* Hooks:

(add-hook 'emacs-lisp-mode-hook 'emacs-lisp-mode/ttybitnik)
;; (add-hook 'emacs-lisp-mode-hook 'package-lint-flymake-setup)

;;* Appearance:


(provide 'tty-prog-elisp)

;;; tty-prog-elisp.el ends here
