;;; tty-misc-exec-path-from-shell.el --- Exec Path from Shell -*- lexical-binding: t -*-

;;; Commentary:

;; Exec-path-from-shell related tunings.

;;; Code:

(require-package 'exec-path-from-shell)

;;* Variables:

;;* Functions:

;;* Main:

(setq exec-path-from-shell-variables
      '("PATH" "MANPATH" "SSH_AUTH_SOCK"))

(exec-path-from-shell-initialize)

;;* Bindings:

;;* Hooks:

;;* Appearance:


(provide 'tty-misc-exec-path-from-shell)

;;; tty-misc-exec-path-from-shell.el ends here
