;;; tty-prog-scheme.el --- Scheme Programming Language -*- lexical-binding: t -*-

;;; Commentary:

;; Scheme-related tunings.

;;; Code:

(require 'scheme)
(require-package 'geiser)
(require-package 'geiser-guile)

;;* Variables:

;;* Functions:

;;* Main:

(setq geiser-guile-binary "guile3.0")

;;* Bindings:

;;* Hooks:

(add-hook 'scheme-mode-hook (lambda ()
                                  (yas-minor-mode)
				  (flymake-mode)
				  (eldoc-mode)))

;;* Appearance:


(provide 'tty-prog-scheme)

;;; tty-prog-scheme.el ends here
