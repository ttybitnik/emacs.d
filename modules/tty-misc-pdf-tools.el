;;; tty-misc-pdf-tools.el --- PDF Tools Library -*- lexical-binding: t -*-

;;; Commentary:

;; Pdf-tools related tunings.

;;; Code:

(require-package 'pdf-tools)

;;* Variables:

;;* Functions:

;;* Main:

(pdf-loader-install)

;;* Bindings:

;;* Hooks:

(add-hook 'pdf-view-mode 'pdf-view-themed-minor-mode)
(add-hook 'pdf-view-mode 'pdf-view-auto-slice-minor-mode)

;;* Appearance:

(diminish 'pdf-view-themed-minor-mode)


(provide 'tty-misc-pdf-tools)

;;; tty-misc-pdf-tools.el ends here
