;;; tty-com.el --- Communication Module -*- lexical-binding: t -*-

;;; Commentary:

;; This module tailors settings and packages for communication in Emacs.

;;; Code:

(require 'tty-com-bbdb)
(require 'tty-com-erc)
(require 'tty-com-gnus)

;;* Variables:

;;* Functions:

;;* Main:

(setq user-full-name (getenv "TTY_NAME"))
(setq user-mail-address (getenv "TTY_EMAIL"))

;;* Bindings:

;;* Hooks:

;;* Appearance:


(provide 'tty-com)

;;; tty-com.el ends here
