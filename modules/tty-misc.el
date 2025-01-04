;;; tty-misc.el --- Miscellaneous Utilities Module -*- lexical-binding: t -*-

;;; Commentary:

;; This module tailors settings and packages for misc utilities in Emacs.

;;; Code:

(require 'tty-misc-bibtex)
(require 'tty-misc-centered-cursor)
(require 'tty-misc-dired)
(require 'tty-misc-exec-path-from-shell)
(require 'tty-misc-nov)
(require 'tty-misc-olivetti)
(require 'tty-misc-paredit)
(require 'tty-misc-pdf-tools)
(require 'tty-misc-which-key)

;;* Variables:

;;* Functions:

(defun config-visit/ttybitnik ()
  "Find `user-init-file'."
  (interactive)
  (find-file user-init-file))

(defun config-reload/ttybitnik ()
  "Reload `user-init-file'."
  (interactive)
  (load user-init-file)
  (load (expand-file-name "switcher.el" local-d/ttybitnik)))

(defun twtxt-entry/ttybitnik ()
  "Visit the twtxt.txt file and insert the current time.
This function visits the microblogging file and inserts the
current time in ISO 8601 format, as per twtxt specification."
  (interactive)
  (let ((twtxt-file (expand-file-name "blog.backend/static/twtxt.txt"
				      projects-d/ttybitnik))
	(time (format-time-string "%Y-%m-%dT%T%z")))
    (find-file twtxt-file)
    (end-of-buffer)
    (insert (format "%s:%s\t" (substring time 0 -2) (substring time -2)))
    (when (featurep 'evil)
      (evil-insert-state))))

;;* Main:

;; (setq-default show-trailing-whitespace t)

(setq kill-ring-max 100)

(setq tramp-default-method "ssh")
(add-to-list 'tramp-remote-path (concat
				 (file-name-as-directory (getenv "HOME"))
				 ".local/bin"))
(add-to-list 'tramp-remote-path 'tramp-own-remote-path)

(defalias 'yes-or-no-p 'y-or-n-p)
(global-subword-mode 1)
(show-paren-mode 1)

(setq electric-pair-pairs '((?\{ . ?\})
                            (?\( . ?\))
                            (?\[ . ?\])
                            (?\" . ?\")))
(electric-pair-mode 1)

;;* Bindings:

(global-set-key (kbd "C-c e") 'config-visit/ttybitnik)
(global-set-key (kbd "C-c R") 'config-reload/ttybitnik)

;;* Hooks:

(add-hook 'before-save-hook 'delete-trailing-whitespace)

(add-to-list 'auto-mode-alist '("\\.log\\'" . conf-mode))

;;* Appearance:


(provide 'tty-misc)

;;; tty-misc.el ends here
