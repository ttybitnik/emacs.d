;;; tty-func-expand-region.el --- Expand Region -*- lexical-binding: t -*-

;;; Commentary:

;; Expand-region related tunings.

;;; Code:

(require-package 'expand-region)

;;* Variables:

;;* Functions:

;;* Main:

;;* Bindings:

(global-set-key (kbd "C-q") 'er/expand-region)

;;* Hooks:

;;* Appearance:


(provide 'tty-func-expand-region)

;;; tty-func-expand-region.el ends here
