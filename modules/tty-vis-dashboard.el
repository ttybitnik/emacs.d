;;; tty-vis-dashboard.el --- Spaceline Dashboard -*- lexical-binding: t -*-

;;; Commentary:

;; Dashboard-related tunings.

;;; Code:

(require-package 'dashboard)

;;* Variables:

;;* Functions:

;;* Main:

(setq dashboard-projects-backend 'project-el)
(setq dashboard-set-navigator nil)
(setq dashboard-center-content t)
(setq dashboard-set-file-icons t)
(setq dashboard-icon-type 'all-the-icons)
(setq dashboard-banner-logo-title "Welcome back, ttybitnik!")
(setq dashboard-agenda-sort-strategy '(time-up))
(setq dashboard-agenda-prefix-format "%s ")
(setq dashboard-agenda-tags-format 'ignore)
(setq recentf-exclude `(,agenda-d/ttybitnik))
(setq dashboard-footer-icon (all-the-icons-fileicon
			     "emacs"
			     :height 1.1
			     :v-adjust -0.05
			     :face 'font-lock-keyword-face))
(setq dashboard-items '((recents . 7)
			(projects . 5)
			(bookmarks . 5)
			(agenda . 5)))

(dashboard-setup-startup-hook)

(eval-after-load 'dashboard '(progn (dashboard-refresh-buffer)))

;;* Bindings:

(global-set-key (kbd "C-c d") 'dashboard-open)

;;* Hooks:

(add-hook 'dashboard-mode-hook 'variable-pitch-mode)

;;* Appearance:


(provide 'tty-vis-dashboard)

;;; tty-vis-dashboard.el ends here
