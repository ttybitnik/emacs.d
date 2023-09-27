;;; tty-proj-projectile.el --- Projectile -*- lexical-binding: t -*-

;;; Commentary:

;; Projectile-related tunings.

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
