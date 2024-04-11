;;; tty-func-popup-kill-ring.el --- Popup Kill Ring -*- lexical-binding: t -*-

;;; Commentary:

;; Popup-kill-ring related tunings.

;; DEPRECATED 2024-01-16: Since `consult' has a `consult-yank-pop' command, I've
;; no need for this package anymore.

;;; Code:

;; (require-package 'popup-kill-ring)

;;* Variables:

;;* Functions:

;;* Main:

;;* Bindings:

(global-set-key (kbd "M-y") 'popup-kill-ring)

;;* Hooks:

;;* Appearance:


(provide 'tty-func-popup-kill-ring)

;;; tty-func-popup-kill-ring.el ends here
