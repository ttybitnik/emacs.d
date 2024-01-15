;;; tty-vis-diminish.el --- Diminish Modes -*- lexical-binding: t -*-

;;; Commentary:

;; Diminish-related tunings.

;;; Code:

(require-package 'diminish)

;;* Variables:

;;* Functions:

;;* Main:

(diminish 'visual-line-mode)
(diminish 'subword-mode)
(diminish 'page-break-lines-mode)
(diminish 'yas-minor-mode)

(eval-after-load 'eldoc '(diminish 'eldoc-mode))
(eval-after-load 'org-indent '(diminish 'org-indent-mode))
(eval-after-load 'face-remap '(diminish 'buffer-face-mode))
(eval-after-load 'autorevert '(diminish 'auto-revert-mode))

;;* Bindings:

;;* Hooks:

;;* Appearance:


(provide 'tty-vis-diminish)

;;; tty-vis-diminish.el ends here
