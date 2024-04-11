;;; tty-proj-projectile.el --- Projectile -*- lexical-binding: t -*-

;;; Commentary:

;; Projectile-related tunings.

;; DEPRECATED 2024-01-15: I've switched to the built-in `project' since it has all
;; the necessary features.

;;; Code:

(require-package 'projectile)

;;* Variables:

;;* Functions:

;;* Main:

(projectile-mode 1)

;;* Bindings:

(global-set-key (kbd "C-c p") 'projectile-command-map)
(global-set-key (kbd "<f5>") 'projectile-compile-project)

;;* Hooks:

;;* Appearance:


(provide 'tty-proj-projectile)

;;; tty-proj-projectile.el ends here
