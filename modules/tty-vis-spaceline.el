;;; tty-vis-spaceline.el --- Spaceline Powerline Library -*- lexical-binding: t -*-

;;; Commentary:

;; Spaceline-related tunings.

;; DEPRECATED 2024-01-16: I've switched to a more default approach.  Probably
;; I'm going to set a custom mode line.

;;; Code:

;; (require-package 'spaceline)
;; (require 'spaceline-config)

;;* Variables:

;;* Functions:

;;* Main:

(setq display-time-format "%H:%M - %d/%m/%Y")
(setq powerline-default-separator 'wave)

(spaceline-spacemacs-theme)
(spaceline-info-mode)
(display-time-mode)

;;* Bindings:

;;* Hooks:

(add-hook 'emacs-startup-hook #'spaceline-toggle-line-column-on)

;;* Appearance:


(provide 'tty-vis-spaceline)

;;; tty-vis-spaceline.el ends here
