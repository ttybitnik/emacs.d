;;; tty-prog-nix.el --- Nix Language and Expressions -*- lexical-binding: t -*-

;;; Commentary:

;; Nix-related tunings.

;;; Code:

(require-package 'nix-mode)

;;* Variables:

;;* Functions:

;;* Main:

;;* Bindings:

;;* Hooks:

(add-to-list 'auto-mode-alist '("\\.nix\\'" . nix-mode))
(add-hook 'nix-mode-hook (lambda ()
                          (yas-minor-mode)
                          (flymake-mode)
                          (eglot-ensure)))

;;* Appearance:


(provide 'tty-prog-nix)

;;; tty-prog-nix.el ends here
