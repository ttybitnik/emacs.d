;;; tty-misc.el --- Miscellaneous Utilities Module -*- lexical-binding: t -*-

;;; Commentary:

;; This module tailors settings and packages for misc utilities in Emacs.

;;; Code:

(require 'which-key)
(require 'tty-misc-bibtex)
(require 'tty-misc-centered-cursor)
(require 'tty-misc-dired)
(require 'tty-misc-exec-path-from-shell)
(require 'tty-misc-nov)
(require 'tty-misc-olivetti)
(require 'tty-misc-paredit)
(require 'tty-misc-pdf-tools)

;;* Variables:

(defvar config-reloaded-p/ttybitnik nil
  "Whether `config-reload/ttybitnik' has been executed.")

;;* Functions:

(defun config-visit/ttybitnik ()
  "Find `user-init-file'."
  (interactive)
  (find-file user-init-file))

(defun config-reload/ttybitnik ()
  "Reload `user-init-file'."
  (interactive)
  (setq config-reloaded-p/ttybitnik t)
  (load user-init-file)
  (load-maybe-switcher/ttybitnik))

(defun load-maybe-switcher/ttybitnik ()
  "Load `local/switcher.el' if it exists."
  (let ((switcher-file (expand-file-name "switcher.el" assets-d/ttybitnik)))
    (if (f-file? switcher-file)
	    (load switcher-file)
      (warn "Switcher file not found: `%s'. Run `switcher' script to fix it."
	        switcher-file))))

(defun twtxt-entry/ttybitnik ()
  "Visit the twtxt.txt file and insert the current time.
This function visits the microblogging file and inserts the
current time in ISO 8601 format, as per twtxt specification."
  (interactive)
  (let ((twtxt-file (expand-file-name "site.eternodevir/static/twtxt.txt"
				                      git-d/ttybitnik))
	    (time (format-time-string "%Y-%m-%dT%T%z")))
    (find-file twtxt-file)
    (end-of-buffer)
    (insert (format "%s:%s\t" (substring time 0 -2) (substring time -2)))
    (when (featurep 'evil)
      (evil-insert-state))))

(defun review-archives-commit/ttybitnik ()
  "Insert a review commit message with the current date and time.
This function generates the standard commit message I use when
reviewing changes to Emacs packages in `package-user-dir'."
  (interactive)
  (let ((time (format-time-string "%Y-%m-%dT%T%z")))
    (insert "chore(security): review " time)))

(defun omni-emacs/ttybitnik ()
  "Check for available package upgrades.
This function is intended to be executed through the GNU Bash REPL
and designed for use with the omni script from my dotfiles repository."
  (let ((updates-p nil)
	    (packages-buffer-name "*Packages*")
	    (messages-buffer-name "*Messages*")
	    pkgs-list)
    (when (get-buffer packages-buffer-name)
      (kill-buffer packages-buffer-name))
    (list-packages)
    (sleep-for 7)
    (with-current-buffer messages-buffer-name
      (save-excursion
	    (goto-char (point-max))
	    (forward-line -30)
	    (when (search-forward "Packages that can be upgraded" nil t)
	      (setq updates-p t))))
    (if updates-p
	    (progn
	      (with-current-buffer packages-buffer-name
	        (package-menu-filter-upgradable)
	        (setq pkgs-list (package-menu-mark-upgrades))
	        (package-menu-execute))
	      (message "EMACS: There are updates available. %s" pkgs-list))
      (progn
	    (kill-buffer packages-buffer-name)
	    (delete-frame)
	    (message "EMACS: No updates available.")))))

;;* Main:

;; (setq-default show-trailing-whitespace t)
(setq-default require-final-newline t)
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

(setq kill-ring-max 100)
(setq tramp-default-method "ssh")
(setq enable-remote-dir-locals t)

(add-to-list 'tramp-remote-path (expand-file-name ".local/bin" (getenv "HOME")))
(add-to-list 'tramp-remote-path 'tramp-own-remote-path)

(defalias 'yes-or-no-p 'y-or-n-p)
(global-subword-mode 1)
(show-paren-mode 1)

(setq electric-pair-pairs '((?\{ . ?\})
                            (?\( . ?\))
                            (?\[ . ?\])
                            (?\" . ?\")))
(electric-pair-mode 1)

(setq which-key-idle-delay 0.5)
(which-key-mode)

;;* Bindings:

(global-set-key (kbd "C-c e") 'config-visit/ttybitnik)
(global-set-key (kbd "C-c R") 'config-reload/ttybitnik)

;;* Hooks:

(add-hook 'before-save-hook 'delete-trailing-whitespace)

(add-to-list 'auto-mode-alist '("\\.log\\'" . conf-mode))

;;* Appearance:


(provide 'tty-misc)

;;; tty-misc.el ends here
