;;; tty-vis-pulsar.el --- Pulsar -*- lexical-binding: t -*-

;;; Commentary:

;; Pulsar-related tunings.

;;; Code:

(require-package 'pulsar)

;;* Variables:

;;* Functions:

;;* Main:

(setq pulsar-pulse nil)
(setq pulsar-delay 0.05)
(setq pulsar-iterations 10)
(setq pulsar-face 'pulsar-magenta)
(setq pulsar-highlight-face 'pulsar-face)

(add-to-list 'pulsar-pulse-functions 'switch-window)
(add-to-list 'pulsar-pulse-functions 'split-and-follow-vertically)
(add-to-list 'pulsar-pulse-functions 'split-and-follow-horizontally)

(pulsar-global-mode 1)

;;* Bindings:

;;* Hooks:

;; (add-hook 'minibuffer-setup-hook #'pulsar-pulse-line)
;; (add-hook 'window-state-change-hook #'pulsar-pulse-line)
(add-hook 'next-error-hook #'pulsar-pulse-line)

;;* Appearance:


(provide 'tty-vis-pulsar)

;;; tty-vis-pulsar.el ends here
