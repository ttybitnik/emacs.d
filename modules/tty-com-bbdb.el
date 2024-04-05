;;; tty-com-bbdb.el --- Insidious Big Brother Database -*- lexical-binding: t -*-

;;; Commentary:

;; BBDB-related tunings.

;;; Code:

(require-package 'bbdb)

;;* Variables:

;;* Functions:

;;* Main:

;; (bbdb-initialize)

;;* Bindings:

;;* Hooks:

(add-hook 'message-mode-hook 'company-mode)

;;* Appearance:


(provide 'tty-com-bbdb)

;;; tty-com-bbdb.el ends here
