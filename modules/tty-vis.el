;;; tty-vis.el --- Visual Elements Module -*- lexical-binding: t -*-

;;; Commentary:

;; This module tailors settings and packages for visual elements in Emacs.

;;; Code:

(require 'tty-vis-all-the-icons)
(require 'tty-vis-beacon)
(require 'tty-vis-dashboard)
(require 'tty-vis-diminish)
(require 'tty-vis-gruvbox-theme)
(require 'tty-vis-keycast)
(require 'tty-vis-rainbow)
(require 'tty-vis-spaceline)

;;* Variables:

;;* Functions:

;;* Main:

(setq inhibit-startup-message t)
(setq visible-bell t)
(setq locale-coding-system 'utf-8
      default-file-name-coding-system 'utf-8
      default-keyboard-coding-system 'utf-8
      default-process-coding-system '(utf-8 . utf-8)
      default-sendmail-coding-system 'utf-8
      default-terminal-coding-system 'utf-8)

(setq org-todo-keyword-faces
      '(("NEXT" . (:foreground "orange" :weight bold))
        ("WAITING" . (:foreground "yellow3" :weight bold))
        ("CANCELED" . (:foreground "gray" :weight bold))
        ("MEETING" . (:foreground "gold" :weight bold))
        ("DRAFT" . (:foreground "tomato" :weight bold))
        ("WRITING" . (:foreground "tomato" :weight bold))
        ("REVISION I" . (:foreground "tomato" :weight bold))
        ("REVISION II" . (:foreground "tomato" :weight bold))
        ("PROOFREADING" . (:foreground "tomato" :weight bold))))

(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)
(fringe-mode 0)

(prefer-coding-system 'utf-8)

(custom-set-faces
 '(default ((t (:family "Iosevka" :foundry "UKWN" :slant normal
			:weight medium :height 102 :width normal))))
 '(dashboard-heading ((t (:inherit font-lock-keyword-face :height 1.1))))
 '(fixed-pitch ((t (:family "Iosevka" :weight medium))))
 '(fringe ((t (:background "burlywood4"))))
 '(org-block ((t (:inherit fixed-pitch))))
 '(org-code ((t (:inherit (shadow fixed-pitch)))))
 '(org-indent ((t (:inherit (org-hide fixed-pitch)))))
 '(org-level-1 ((t (:height 1.5))))
 '(org-level-2 ((t (:height 1.4))))
 '(org-level-3 ((t (:height 1.3))))
 '(org-level-4 ((t (:height 1.2))))
 '(org-level-5 ((t (:height 1.1))))
 '(org-level-6 ((t (:height 1.1))))
 '(org-level-7 ((t (:height 1.1))))
 '(org-level-8 ((t (:height 1.1))))
 '(org-table ((t (:inherit fixed-pitch))))
 '(variable-pitch ((t (:family "Iosevka Aile")))))

;;* Bindings:

;;* Hooks:

(if (display-graphic-p)
    (add-hook 'prog-mode-hook 'hl-line-mode))

(add-hook 'prog-mode-hook 'display-line-numbers-mode)
(add-hook 'conf-mode-hook 'display-line-numbers-mode)

;;* Appearance:


(provide 'tty-vis)

;;; tty-vis.el ends here
