;;; tty-proj-magit.el --- Magit -*- lexical-binding: t -*-

;;; Commentary:

;; Magit-related tunings.

;;; Code:

(require-package 'magit)

;;* Variables:

;;* Functions:

;;* Main:

(setq magit-push-always-verify nil)
(setq git-commit-summary-max-length 50)

;;* Bindings:

(global-set-key (kbd "M-g") ' magit-status)

;;* Hooks:

;;* Appearance:


(provide 'tty-proj-magit)

;;; tty-proj-magit.el ends here
