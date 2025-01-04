;;; tty-nav-switch-window.el --- Switch Window -*- lexical-binding: t -*-

;;; Commentary:

;; Switch-window related tunings.

;; DEPRECATED 2025-01-04: Since I switched to `evil', I'm practicing an approach
;; more oriented toward Vim fundamentals.  Disabling `switch-window' for now,
;; though I'm not sure if I'll stick with it or try `ace-window' or the built-in
;; `windmove' later.

;;; Code:

(require-package 'switch-window)

;;* Variables:

;;* Functions:

;;* Main:

(setq switch-window-input-style 'minibuffer)
(setq switch-window-shortcut-style 'qwerty)
(setq switch-window-increase 4)
(setq switch-window-threshold 2)
(setq switch-window-qwerty-shortcuts '("a" "s" "d" "f" "j" "k" "l" "i" "o"))

;;* Bindings:

(global-set-key [remap other-window] 'switch-window)

;;* Hooks:

;;* Appearance:


(provide 'tty-nav-switch-window)

;;; tty-nav-switch-window.el ends here
