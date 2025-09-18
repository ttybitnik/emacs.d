;;; tty-prog-haskell.el --- Haskell Programming Language -*- lexical-binding: t -*-

;;; Commentary:

;; Haskell-related tunings.

;; I don't need `haskell-ts-mode' (or its variants) yet since syntax
;; highlighting is already provided via `tty-prog-tree-sitter'.

;;; Code:

(require-package 'haskell-mode)

;;* Variables:

;;* Functions:

(defun haskell-mode/ttybitnik ()
  "Set up `haskell-mode' hooks."
  (yas-minor-mode)
  (flymake-mode)
  (eglot-ensure)
  (turn-on-haskell-indentation)
  (haskell-auto-insert-module-template)
  (interactive-haskell-mode)
  (haskell-format-on-save-mode))

;;* Main:

(reformatter-define haskell-format
  :program "ormolu"
  :mode t)

;;* Bindings:

(define-key haskell-mode-map (kbd "C-c s H") 'hoogle)

;;* Hooks:

(add-hook 'haskell-mode-hook 'haskell-mode/ttybitnik)

;;* Appearance:


(provide 'tty-prog-haskell)

;;; tty-prog-haskell.el ends here
