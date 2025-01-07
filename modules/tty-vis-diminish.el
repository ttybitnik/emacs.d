;;; tty-vis-diminish.el --- Diminish Modes -*- lexical-binding: t -*-

;;; Commentary:

;; Diminish-related tunings.

;;; Code:

(require-package 'diminish)

;;* Variables:

;;* Functions:

;;* Main:

(diminish 'all-the-icons-dired-mode)
(diminish 'beacon-mode)
(diminish 'centered-cursor-mode)
(diminish 'company-mode)
(diminish 'dired-async-mode)
(diminish 'evil-collection-unimpaired-mode)
(diminish 'flycheck-mode)
(diminish 'flyspell-mode)
(diminish 'helm-mode)
(diminish 'hungry-delete-mode)
(diminish 'olivetti-mode)
(diminish 'org-auto-tangle-mode)
(diminish 'org-roam-bibtex-mode)
(diminish 'org-roam-ui-follow-mode)
(diminish 'page-break-lines-mode)
(diminish 'pdf-view-themed-minor-mode)
(diminish 'rainbow-delimiters-mode)
(diminish 'subword-mode)
(diminish 'tree-sitter-mode)
(diminish 'undo-tree-mode)
(diminish 'visual-line-mode)
(diminish 'which-key-mode)
(diminish 'yas-minor-mode)

(eval-after-load 'eldoc '(diminish 'eldoc-mode))
(eval-after-load 'org-indent '(diminish 'org-indent-mode))
(eval-after-load 'face-remap '(diminish 'buffer-face-mode))
(eval-after-load 'autorevert '(diminish 'auto-revert-mode))
(eval-after-load 'rainbow-mode '(diminish 'rainbow-mode))

;;* Bindings:

;;* Hooks:

;;* Appearance:


(provide 'tty-vis-diminish)

;;; tty-vis-diminish.el ends here
