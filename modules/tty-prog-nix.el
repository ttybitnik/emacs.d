;;; tty-prog-nix.el --- Nix Language and Expressions -*- lexical-binding: t -*-

;;; Commentary:

;; Nix-related tunings.

;;; Code:

(require-package 'nix-mode)

;;* Variables:

;;* Functions:

(defun company-nix/ttybitnik ()
  "Set up `company-mode' for `nix-mode'."
  (setq-local company-minimum-prefix-length 1)
  (setq-local company-backends '((company-capf
                                  company-dabbrev-code
                                  company-keywords
                                  company-files
                                  company-yasnippet))))

;;* Main:

;;* Bindings:

;;* Hooks:

(add-to-list 'auto-mode-alist '("\\.nix\\'" . nix-mode))
(add-hook 'nix-mode-hook (lambda ()
                          (yas-minor-mode)
                          (flymake-mode)
                          (company-mode)
                          (eglot-ensure)
                          (company-nix/ttybitnik)))

;;* Appearance:


(provide 'tty-prog-nix)

;;; tty-prog-nix.el ends here
