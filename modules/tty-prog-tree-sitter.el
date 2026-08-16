;;; tty-prog-tree-sitter.el --- Tree-sitter -*- lexical-binding: t -*-

;;; Commentary:

;; Tree-sitter related tunings.

;;; Code:

(require 'treesit)
(require-package 'treesit-auto)

;;* Variables:

;;* Functions:

;;* Main:

(setq treesit-auto-install 'prompt)

(treesit-auto-add-to-auto-mode-alist 'all)
(global-treesit-auto-mode t)

;;* Bindings:

;;* Hooks:

;;* Appearance:

(provide 'tty-prog-tree-sitter)

;;; tty-prog-tree-sitter.el ends here
