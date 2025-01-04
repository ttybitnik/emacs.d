;;; tty-nav-avy.el --- Avy Jumper -*- lexical-binding: t -*-

;;; Commentary:

;; Avy-related tunings.

;; DEPRECATED 2025-01-04: Since I switched to `evil', I'm practicing an approach
;; more oriented toward Vim fundamentals.  Although `avy' is excellent, I'm
;; disabling it for now.

;;; Code:

(require-package 'avy)

;;* Variables:

;;* Functions:

;;* Main:

;;* Bindings:

(global-set-key (kbd "M-s") 'avy-goto-char)
(define-prefix-command 'avy-remap)
(global-set-key (kbd "C-c M-s") 'avy-remap)
(define-key avy-remap (kbd ".") 'isearch-forward-symbol-at-point)
(define-key avy-remap (kbd "M-.") 'isearch-forward-thing-at-point)
(define-key avy-remap (kbd "M-w") 'eww-search-words)
(define-key avy-remap (kbd "_") 'isearch-forward-symbol)
(define-key avy-remap (kbd "o") 'occur)
(define-key avy-remap (kbd "g") 'grep)
(define-key avy-remap (kbd "h .") 'highlight-symbol-at-point)
(define-key avy-remap (kbd "h f") 'hi-lock-find-patterns)
(define-key avy-remap (kbd "h l") 'highlight-lines-matching-regexp)
(define-key avy-remap (kbd "h p") 'highlight-phrase)
(define-key avy-remap (kbd "h r") 'highlight-regexp)
(define-key avy-remap (kbd "h u") 'unhighlight-regexp)
(define-key avy-remap (kbd "h w") 'hi-lock-write-interactive-patterns)

;;* Hooks:

;;* Appearance:


(provide 'tty-nav-avy)

;;; tty-nav-avy.el ends here
