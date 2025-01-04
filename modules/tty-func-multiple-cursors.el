;;; tty-func-multiple-cursors.el --- Multiple Cursors -*- lexical-binding: t -*-

;;; Commentary:

;; Multiple-cursors related tunings.

;; DEPRECATED 2025-01-04: Since I switched to `evil', I'm practicing an approach
;; more oriented toward Vim fundamentals.  Disabling `multiple-cursors' for now.

;;; Code:

(require-package 'multiple-cursors)

;;* Variables:

;;* Functions:

;;* Main:

;;* Bindings:

(global-set-key (kbd "C-S-c C-S-c") 'mc/mark-more-like-this-extended)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c q") 'mc/mark-all-like-this)
(define-key mc/keymap (kbd "<return>") nil)

(when (not (display-graphic-p))
  (global-set-key (kbd "C-c m") 'mc/mark-more-like-this-extended))

;;* Hooks:

;;* Appearance:


(provide 'tty-func-multiple-cursors)

;;; tty-func-multiple-cursors.el ends here
