;;; tty-misc-vertico.el --- Vertical Interactive Completion -*- lexical-binding: t -*-

;;; Commentary:

;; Vertico-related tunings

;;; Code:
(require-package 'vertico)

;;* Variables:

;;* Functions:

;;* Main:

;; (setq vertico-count 20)
;; (setq vertico-resize t)
;; (setq vertico-cycle t)

(setq read-file-name-completion-ignore-case t)
(setq read-buffer-completion-ignore-case t)
(setq completion-ignore-case t)

(vertico-mode)

;;* Bindings:

;;* Hooks:

;;* Appearance:


(provide 'tty-misc-vertico)

;;; tty-misc-vertico.el ends here
