;;; tty-func-undo-tree.el --- Undo Tree -*- lexical-binding: t -*-

;;; Commentary:

;; Undo-tree related tunings.

;;; Code:

(require-package 'undo-tree)

;;* Variables:

;;* Functions:

;;* Main:

(setq undo-tree-auto-save-history nil)

(global-undo-tree-mode 1)

;;* Bindings:

;;* Hooks:

;;* Appearance:

(diminish 'undo-tree-mode)


(provide 'tty-func-undo-tree)

;;; tty-func-undo-tree.el ends here
