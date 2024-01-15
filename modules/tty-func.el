;;; tty-func.el --- Functionality Module -*- lexical-binding: t -*-

;;; Commentary:

;; This module tailors settings and packages to extend functionality in Emacs.

;;; Code:
;; (require 'tty-func-undo-tree)

(require 'tty-func-async)
(require 'tty-func-expand-region)
(require 'tty-func-hungry-delete)
(require 'tty-func-multiple-cursors)
(require 'tty-func-popup-kill-ring)
(require 'tty-func-sudo-edit)
(require 'tty-func-vundo)
(require 'tty-func-wgrep)
(require 'tty-func-zzz-to-char)
(require 'epa-file)

;;* Variables:

;;* Functions:

;;* Main:

(setq make-backup-files nil)
(setq backup-directory-alist
      `(("." . ,(file-name-as-directory
		 (concat orpheusmx-d/ttybitnik "saves")))))
(setq auto-save-file-name-transforms
      `((".*" ,(file-name-as-directory
		(concat orpheusmx-d/ttybitnik "saves")) t)))

(epa-file-enable)
;; (setf epa-pinentry-mode 'loopback) pinentry inside Emacs

(when (file-exists-p (expand-file-name ".restrict.el.gpg" auth-d/ttybitnik))
     (load (expand-file-name ".restrict.el.gpg" auth-d/ttybitnik)))

(transient-mark-mode 1)
(global-auto-revert-mode 1) ;; resource intensive

;;* Bindings:

;;* Hooks:

;;* Appearance:


(provide 'tty-func)

;;; tty-func.el ends here
