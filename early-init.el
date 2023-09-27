;;; early-init.el --- Pre-initialization Emacs 27+ -*- lexical-binding: t -*-

;;; Commentary:

;; This file is loaded prior to initializing the package system and GUI,
;; allowing to set variables that influence the package initialization process.

;;; Code:

;;* Variables:

;;* Functions:

;;* Main:

(setq package-enable-at-startup nil)

;;* Bindings:

;;* Hooks:

;;* Appearance:


(provide 'early-init)

;;; early-init.el ends here
