;;; tty-vis.el --- Visual Elements Module -*- lexical-binding: t -*-

;;; Commentary:

;; This module tailors settings and packages for visual elements in Emacs.

;;; Code:
;; (require 'tty-vis-gruvbox-theme)
;; (require 'tty-vis-pulsar)
;; (require 'tty-vis-spaceline)

(require 'tty-vis-all-the-icons)
(require 'tty-vis-beacon)
(require 'tty-vis-dashboard)
(require 'tty-vis-diminish)
(require 'tty-vis-keycast)
(require 'tty-vis-marginalia)
(require 'tty-vis-modus-themes)
(require 'tty-vis-rainbow)


;;* Variables:

;;* Functions:

(defun match-current-line-background/ttybitnik ()
  "Set the background of `line-number-current-line' to match `line-number'.
This function is intended to be called through `local/switcher-day.el'
and `local/switcher-night.el' files."
  (set-face-attribute 'line-number-current-line nil
                      :background (face-background 'line-number)))

;;* Main:

(load-file (expand-file-name "switcher.el" local-d/ttybitnik))

(setq inhibit-startup-message t)
;; (setq visible-bell t)
(setq locale-coding-system 'utf-8
      default-file-name-coding-system 'utf-8
      default-keyboard-coding-system 'utf-8
      default-process-coding-system '(utf-8 . utf-8)
      default-sendmail-coding-system 'utf-8
      default-terminal-coding-system 'utf-8)

(setq-default fringes-outside-margins t)
(fringe-mode '8)
(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)
(prefer-coding-system 'utf-8)

(column-number-mode t)

(setq org-todo-keyword-faces
      '(("TODO" . (:inherit org-todo))
	("NEXT" . (:inherit (outline-3 org-todo)))
        ("WAIT" . (:inherit (outline-2 org-todo)))
        ("MEET" . (:inherit (outline-7 org-todo)))
        ("CANCELED" . (:inherit (outline-8 org-todo)))
        ("DRAFT" . (:inherit (shadow org-todo)))
        ("WRITING" . (:inherit (shadow org-todo)))
        ("REVISION I" . (:inherit (shadow org-todo)))
        ("REVISION II" . (:inherit (shadow org-todo)))
        ("PROOFREADING" . (:inherit (shadow org-todo)))
	("READING" . (:inherit (outline-2 org-todo)))
	("CAPTURED" . (:inherit (outline-7 org-todo)))))


(custom-set-faces
 '(default ((t (:family "Iosevka" :foundry "UKWN" :slant normal
			:weight medium :height 102 :width normal))))
 '(dashboard-heading ((t (:inherit font-lock-keyword-face :height 1.1))))
 '(fixed-pitch ((t (:family "Iosevka" :weight medium))))
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

(setq display-line-numbers-type 'relative)

;;* Bindings:

;;* Hooks:

(if (display-graphic-p)
    (add-hook 'prog-mode-hook 'hl-line-mode))

(add-hook 'prog-mode-hook 'display-line-numbers-mode)
(add-hook 'conf-mode-hook 'display-line-numbers-mode)

;;* Appearance:


(provide 'tty-vis)

;;; tty-vis.el ends here
