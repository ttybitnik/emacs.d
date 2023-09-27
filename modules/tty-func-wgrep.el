;;; tty-func-wgrep.el --- Writable Grep -*- lexical-binding: t -*-

;;; Commentary:

;; Wgrep-related tunings.

;;; Code:

(require-package 'wgrep)

;;* Variables:

;;* Functions:

;;* Main:

;;* Bindings:

(global-set-key (kbd "C-c C-e") 'wgrep-change-to-wgrep-mode)
(global-set-key (kbd "C-c C-s p") 'wgrep-apply-change)
(global-set-key (kbd "C-c C-s s") 'wgrep-save-all-buffers)

;;* Hooks:

;;* Appearance:


(provide 'tty-func-wgrep)

;;; tty-func-wgrep.el ends here
