;;; tty-misc-nov.el --- Nov EPUB Reader -*- lexical-binding: t -*-

;;; Commentary:

;; Nov-related tunings.

;;; Code:

(require-package 'nov)

;;* Variables:

;;* Functions:

;;* Main:

(add-to-list 'auto-mode-alist '("\\.\\(epub\\|mobi\\)\\'" . nov-mode))

;;* Bindings:

;;* Hooks:

;;* Appearance:


(provide 'tty-misc-nov)

;;; tty-misc-nov.el ends here
