;;; tty-prog-nix.el --- Nix Language and Expressions -*- lexical-binding: t -*-

;;; Commentary:

;; Nix-related tunings.

;;; Code:

(require-package 'nix-mode)

;;* Variables:

;;* Functions:

(defun nix-mode/ttybitnik ()
  "Set up `nix-mode' hooks."
  (yas-minor-mode)
  (flymake-mode)
  (eglot-ensure))

;;* Main:

;;* Bindings:

;;* Hooks:

(add-to-list 'auto-mode-alist '("\\.nix\\'" . nix-mode))
(add-hook 'nix-mode-hook 'nix-mode/ttybitnik)

;;* Appearance:


(provide 'tty-prog-nix)

;;; tty-prog-nix.el ends here
