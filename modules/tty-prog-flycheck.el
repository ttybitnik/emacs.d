;;; tty-prog-flycheck.el --- Flycheck Syntax -*- lexical-binding: t -*-

;;; Commentary:

;; Flycheck-related tunings.

;;; Code:

(require-package 'flycheck)

;;* Variables:

;;* Functions:

;;* Main:

(setq flycheck-idle-change-delay 2)

;;* Bindings:

;;* Hooks:

;;* Appearance:

(diminish 'flycheck-mode)


(provide 'tty-prog-flycheck)

;;; tty-prog-flycheck.el ends here
