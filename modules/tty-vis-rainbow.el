;;; tty-vis-rainbow.el --- Rainbow Colorize -*- lexical-binding: t -*-

;;; Commentary:

;; Rainbow-related tunings.

;;; Code:

(require-package 'rainbow-mode)
(require-package 'rainbow-delimiters)

;;* Variables:

;;* Functions:

;;* Main:

;;* Bindings:

;;* Hooks:

(add-hook 'prog-mode-hook 'rainbow-mode)
(add-hook 'conf-mode-hook 'rainbow-mode)
(add-hook 'org-mode-hook 'rainbow-mode)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

;;* Appearance:


(provide 'tty-vis-rainbow)

;;; tty-vis-rainbow.el ends here
