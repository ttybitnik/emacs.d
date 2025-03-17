;;; tty-diff-hl.el --- Diff Highlight -*- lexical-binding: t -*-

;;; Commentary:

;; Diff-hl related tunings.

;;; Code:

(require-package 'diff-hl)

;;* Variables:

;;* Functions:

;;* Main:

(setq vc-git-diff-switches '("--histogram"))
(setq diff-hl-flydiff-delay 0.5)
(setq diff-hl-update-async t)

(global-diff-hl-mode 1)

;;* Bindings:

;;* Hooks:

(add-hook 'magit-pre-refresh-hook 'diff-hl-magit-pre-refresh)
(add-hook 'magit-post-refresh-hook 'diff-hl-magit-post-refresh)

(add-hook 'dired-mode-hook 'diff-hl-dired-mode)
(add-hook 'prog-mode-hook 'turn-on-diff-hl-mode)
(add-hook 'conf-mode-hook 'turn-on-diff-hl-mode)

;;* Appearance:

(provide 'tty-proj-diff-hl)

;;; tty-proj-diff-hl.el ends here
