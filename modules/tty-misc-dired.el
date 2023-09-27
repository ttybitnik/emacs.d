;;; tty-misc-dired.el --- Directory Editor -*- lexical-binding: t -*-

;;; Commentary:

;; Dired-related tunings.

;;; Code:

(require 'dired)
(require 'dired-x)
(require-package 'dired-subtree)

;;* Variables:

;;* Functions:

;;* Main:

(setq dired-listing-switches "-alhvF --color=auto --group-directories-first")
(setq dired-dwim-target t)
(setq dired-vc-rename-file t)
(setq dired-create-destination-dirs 'ask)
(setq dired-isearch-filenames 'dwim)
(setq dired-guess-shell-alist-user
      '(("\\.\\(png\\|jpe?g\\|tiff\\)" "imv" "xdg-open")
	("\\.\\(mp[34]\\|m4a\\|ogg\\|flac\\|webm\\|mkv\\)" "mpv" "xdg-open")
	(".*" "xdg-open")))

(setq dired-subtree-use-backgrounds nil)

;;* Bindings:

(define-key dired-mode-map (kbd "<tab>") 'dired-subtree-toggle)
(define-key dired-mode-map (kbd "<backtab>") 'dired-subtree-remove)

;;* Hooks:

(add-hook 'dired-mode-hook 'hl-line-mode)
(add-hook 'dired-mode-hook 'all-the-icons-dired-mode)

;;* Appearance:


(provide 'tty-misc-dired)

;;; tty-misc-dired.el ends here
