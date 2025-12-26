;;; tty-proj-project.el --- Project -*- lexical-binding: t -*-

;;; Commentary:

;; Project-related tunings.

;; Run `project-remember-projects-under' once to index all projects below a
;; given directory.

;;; Code:

(require-package 'project)

;;* Variables:

;;* Functions:

;;* Main:

(setq project-switch-commands 'project-find-file)

;; (project-remember-projects-under git-d/ttybitnik t)

;;* Bindings:

;;* Hooks:

;;* Appearance:


(provide 'tty-proj-project)

;;; tty-proj-project.el ends here
