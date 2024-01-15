;;; tty-func-orderless.el --- Orderless -*- lexical-binding: t -*-

;;; Commentary:

;; Orderless-related tunings.

;;; Code:
(require-package 'orderless)

;;* Variables:

;;* Functions:

;;* Main:

(setq completion-styles '(orderless basic))
(setq completion-category-overrides '((file (styles basic partial-completion))))

;;* Bindings:

;;* Hooks:

;;* Appearance:


(provide 'tty-func-orderless)

;;; tty-func-orderless.el ends here
