;;; tty-nav-which-key.el --- Which Key -*- lexical-binding: t -*-

;;; Commentary:

;; Which-key related tunings.

;;; Code:

(require-package 'which-key)

;;* Variables:

;;* Functions:

;;* Main:

(setq which-key-idle-delay 0.5)

(which-key-mode)

;;* Bindings:

;;* Hooks:

;;* Appearance:

(diminish 'which-key-mode)


(provide 'tty-nav-which-key)

;;; tty-nav-which-key.el ends here
