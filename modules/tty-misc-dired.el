;;; tty-misc-dired.el --- Directory Editor -*- lexical-binding: t -*-

;;; Commentary:

;; Dired-related tunings.

;;; Code:

(require 'dired)
(require 'dired-x)
(require 'wdired)
(require-package 'dired-sidebar)
(require-package 'dired-subtree)

;;* Variables:

;;* Functions:

;;* Main:

(setq dired-listing-switches "-AlhvF --color=auto --group-directories-first")
(setq dired-dwim-target t)
(setq dired-vc-rename-file t)
(setq dired-create-destination-dirs 'ask)
(setq dired-isearch-filenames 'dwim)
(setq dired-guess-shell-alist-user
      '(("\\.\\(png\\|jpe?g\\|tiff\\)" "imv" "xdg-open")
	("\\.\\(mp[34]\\|m4a\\|ogg\\|flac\\|webm\\|mkv\\)" "mpv" "xdg-open")
	(".*" "xdg-open")))

(setq wdired-allow-to-change-permissions t)
(setq wdired-create-parent-directories t)

(setq dired-subtree-use-backgrounds nil)

(setq dired-sidebar-theme 'none)
(setq dired-sidebar-use-custom-font nil)
(setq dired-sidebar-width 50)
(setq dired-sidebar-should-follow-file t)
(setq dired-sidebar-display-alist '((side . right)(slot . 1)))
(setq dired-sidebar-skip-subtree-parent t)

;;* Bindings:

(define-key global-map (kbd "C-x C-j") 'dired-jump)
(define-key global-map (kbd "C-x j") 'dired-sidebar-toggle-sidebar)

(define-key dired-mode-map (kbd "<tab>") 'dired-subtree-toggle)
(define-key dired-mode-map (kbd "<backtab>") 'dired-subtree-remove)
(define-key dired-mode-map (kbd "K") 'dired-kill-subdir)

;;* Hooks:

(add-hook 'dired-mode-hook 'hl-line-mode)
(add-hook 'dired-mode-hook 'all-the-icons-dired-mode)
;; (add-hook 'dired-mode-hook #'dired-hide-details-mode)

;;* Appearance:


(provide 'tty-misc-dired)

;;; tty-misc-dired.el ends here
