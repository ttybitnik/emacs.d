;;; tty-org-cdlatex.el --- CDLaTeX -*- lexical-binding: t -*-

;;; Commentary:

;; Cdlatex-related tunings

;;; Code:

(require-package 'cdlatex)
(require-package 'auctex)

;;* Variables:

;;* Functions:

;;* Main:


;;* Bindings:

;;* Hooks:

(add-hook 'latex-mode-hook 'turn-on-cdlatex)
;; Enabling it only on Project->Writing `org' files.
;; (add-hook 'org-mode-hook   'turn-on-org-cdlatex)

;;* Appearance:


(provide 'tty-org-cdlatex)

;;; tty-org-cdlatex.el ends here
