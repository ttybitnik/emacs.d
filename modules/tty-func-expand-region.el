;;; tty-func-expand-region.el --- Expand Region -*- lexical-binding: t -*-

;;; Commentary:

;; Expand-region related tunings.

;; DEPRECATED 2025-01-04: Since I switched to `evil', I'm practicing an approach
;; more oriented toward Vim fundamentals.  Disabling `expand-region' for now.

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
