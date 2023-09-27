;;; tty-vis-linum-relative.el --- Linum Relative -*- lexical-binding: t -*-

;;; Commentary:

;; Linum-relative related tunings.

;;; Code:

(require-package 'linum-relative)

;;* Variables:

;;* Functions:

;;* Main:

(setq linum-relative-backend 'display-line-numbers-mode)

;;* Bindings:

;;* Hooks:

(add-hook 'prog-mode-hook 'linum-relative-mode)
(add-hook 'conf-mode-hook 'linum-relative-mode)

;;* Appearance:

(diminish 'linum-relative-mode)


(provide 'tty-vis-linum-relative)

;;; tty-vis-linum-relative.el ends here
