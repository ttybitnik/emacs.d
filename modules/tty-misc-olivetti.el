;;; tty-misc-olivetti.el --- Olivetti Margins Environment -*- lexical-binding: t -*-

;;; Commentary:

;; Olivetti-related tunings.

;;; Code:

(require-package 'olivetti)

;;* Variables:

;;* Functions:

;;* Main:

(setq-default olivetti-body-width 85)

;;* Bindings:

(global-set-key (kbd "C-c o") 'olivetti-mode)

;;* Hooks:

;;* Appearance:


(provide 'tty-misc-olivetti)

;;; tty-misc-olivetti.el ends here
