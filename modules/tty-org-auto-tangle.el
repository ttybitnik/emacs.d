;;; tty-org-auto-tangle.el --- Org-mode Auto Tangle -*- lexical-binding: t -*-

;;; Commentary:

;; Org-auto-tangle related tunings.

;;; Code:

(eval-after-load 'org
  '(progn
     (require-package 'org-auto-tangle)))

;;* Variables:

;;* Functions:

;;* Main:

;;* Bindings:

;;* Hooks:

(add-hook 'org-mode-hook 'org-auto-tangle-mode)

;;* Appearance:


(provide 'tty-org-auto-tangle)

;;; tty-org-auto-tangle.el ends here
