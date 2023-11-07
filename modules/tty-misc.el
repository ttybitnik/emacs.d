;;; tty-misc.el --- Miscellaneous Utilities Module -*- lexical-binding: t -*-

;;; Commentary:

;; This module tailors settings and packages for misc utilities in Emacs.

;;; Code:

(require 'tty-misc-bibtex)
(require 'tty-misc-centered-cursor)
(require 'tty-misc-company)
(require 'tty-misc-dired)
(require 'tty-misc-exec-path-from-shell)
(require 'tty-misc-nov)
(require 'tty-misc-olivetti)
(require 'tty-misc-pdf-tools)

;;* Variables:

;;* Functions:

(defun config-visit/ttybitnik ()
  "Find `user-init-file'."
  (interactive)
  (find-file user-init-file))

(defun config-reload/ttybitnik ()
  "Reload `user-init-file'."
  (interactive)
  (load user-init-file))

;;* Main:

(setq-default show-trailing-whitespace t)

(setq electric-pair-pairs '((?\{ . ?\})
                            (?\( . ?\))
                            (?\[ . ?\])
                            (?\" . ?\")))
(setq kill-ring-max 100)

(setq tramp-default-method "ssh")

(defalias 'yes-or-no-p 'y-or-n-p)
(global-subword-mode 1)
(electric-pair-mode 1)
(show-paren-mode 1)

;;* Bindings:

(global-set-key (kbd "C-c e") 'config-visit/ttybitnik)
(global-set-key (kbd "C-c r") 'config-reload/ttybitnik)

;;* Hooks:

;;* Appearance:


(provide 'tty-misc)

;;; tty-misc.el ends here
