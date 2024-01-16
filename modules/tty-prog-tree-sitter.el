;;; tty-prog-tree-sitter.el --- Tree-sitter -*- lexical-binding: t -*-

;;; Commentary:

;; Tree-sitter related tunings.

;;; Code:
(require-package 'tree-sitter)
(require-package 'tree-sitter-langs)

;;* Variables:

;;* Functions:

;;* Main:

(global-tree-sitter-mode)

;;* Bindings:

;;* Hooks:

(add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode)

;;* Appearance:

(diminish 'tree-sitter-mode)

(provide 'tty-prog-tree-sitter)

;;; tty-prog-tree-sitter.el ends here
