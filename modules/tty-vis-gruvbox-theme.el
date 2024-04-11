;;; tty-vis-gruvbox-theme.el --- Gruvbox Themes -*- lexical-binding: t -*-

;;; Commentary:

;; Gruvbox-theme related tunings.

;;; Code:

;; (require-package 'gruvbox-theme)

;;* Variables:

;;* Functions:

;;* Main:

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

(custom-set-faces
 '(fringe ((t (:background "burlywood4")))))

;;* Bindings:

;;* Hooks:

;;* Appearance:


(provide 'tty-vis-gruvbox-theme)

;;; tty-vis-gruvbox-theme.el ends here
