;;; tty-prog-lisp.el --- List Processing Programming Languages -*- lexical-binding: t -*-

;;; Commentary:

;; LISP-related tunings.

;;; Code:

(require 'lisp-mode)
(require-package 'sly)

;;* Variables:

;;* Functions:

(defun company-lisp-mode/ttybitnik ()
  "Set up `company-mode' for `lisp-mode'."
  (setq-local company-minimum-prefix-length 1)
  (setq-local company-backends '((company-capf
                                  company-dabbrev-code
                                  company-keywords
                                  company-files
                                  company-yasnippet))))

;;* Main:

(setq inferior-lisp-program "sbcl")

(add-to-list 'sly-contribs 'sly-autodoc)
(add-to-list 'sly-contribs 'sly-fancy)

;;* Bindings:

;;* Hooks:

(add-hook 'emacs-lisp-mode-hook (lambda ()
                                  (yas-minor-mode)
                                  (flycheck-mode)
                                  (company-mode)
                                  (company-lisp-mode/ttybitnik)
                                  (eldoc-mode)))

;;* Appearance:


(provide 'tty-prog-lisp)

;;; tty-prog-lisp.el ends here
