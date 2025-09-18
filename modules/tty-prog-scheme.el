;;; tty-prog-scheme.el --- Scheme Programming Language -*- lexical-binding: t -*-

;;; Commentary:

;; Scheme-related tunings.

;;; Code:

(require 'scheme)
(require 'cmuscheme)
(require-package 'geiser)
(require-package 'geiser-guile)
;; (require-package 'geiser-chicken)

;;* Variables:

;;* Functions:

(defun scheme-mode/ttybitnik ()
  "Set up `scheme-mode' hooks."
  (yas-minor-mode)
  (flymake-mode)
  (eldoc-mode)
  (evil-cleverparens-mode))

;;* Main:

;; TODO: Perhaps create a prompt logic for this.
;; (setq scheme-program-name "guile3.0")
(setq scheme-program-name "csi")

(setq geiser-guile-binary "guile3.0")
(setq geiser-chicken-binary "csi")

;;* Bindings:

;;* Hooks:

(add-hook 'scheme-mode-hook 'scheme-mode/ttybitnik)

;;* Appearance:


(provide 'tty-prog-scheme)

;;; tty-prog-scheme.el ends here
