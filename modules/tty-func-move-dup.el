;;; tty-func-move-dup.el --- Move and Duplicate -*- lexical-binding: t -*-

;;; Commentary:

;; Move-dup related tunings.

;; DEPRECATED 2025-01-04: Since I switched to `evil', I'm practicing an approach
;; more oriented toward Vim fundamentals.  Disabling `move-dup' for now.

;;; Code:

(require-package 'move-dup)

;;* Variables:

;;* Functions:

;;* Main:

;;* Bindings:

(global-set-key (kbd "C-M-<up>") 'move-dup-move-lines-up)
(global-set-key (kbd "C-M-<down>") 'move-dup-move-lines-down)

;;* Hooks:

;;* Appearance:


(provide 'tty-func-move-dup)

;;; tty-func-move-dup.el ends here
