;;; tty-org-bullets.el --- Org-mode Bullets -*- lexical-binding: t -*-

;;; Commentary:

;; Org-bullets related tunings.

;;; Code:

(require-package 'org-bullets)

;;* Variables:

;;* Functions:

;;* Main:

(setq org-bullets-bullet-list '("●"))

;;* Bindings:

;;* Hooks:

(add-hook 'org-mode-hook 'org-bullets-mode)

;;* Appearance:


(provide 'tty-org-bullets)

;;; tty-org-bullets.el ends here
