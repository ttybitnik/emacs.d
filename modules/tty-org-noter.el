;;; tty-org-noter.el --- Org-mode Noter -*- lexical-binding: t -*-

;;; Commentary:

;; Org-noter related tunings.

;;; Code:

(require-package 'org-noter)
(require 'pdf-tools)
(require 'nov)

;;* Variables:

;;* Functions:

;;* Main:

(setq org-noter-doc-split-fraction '(0.57 0.43))

;;* Bindings:

(global-set-key (kbd "C-c N") 'org-noter)

;;* Hooks:

;;* Appearance:


(provide 'tty-org-noter)

;;; tty-org-noter.el ends here
