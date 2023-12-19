;;; tty-misc-olivetti.el --- Olivetti Margins Environment -*- lexical-binding: t -*-

;;; Commentary:

;; Olivetti-related tunings.

;;; Code:

(require-package 'olivetti)

;;* Variables:

;;* Functions:

;;* Main:

(setq-default olivetti-body-width 110)

;;* Bindings:

(global-set-key (kbd "C-c o") 'olivetti-mode)

;;* Hooks:

;;* Appearance:

(diminish 'olivetti-mode)


(provide 'tty-misc-olivetti)

;;; tty-misc-olivetti.el ends here
