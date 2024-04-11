;;; tty-nav-helm.el --- Helm Incremental Framework  -*- lexical-binding: t -*-

;;; Commentary:

;; Helm-related tunings.

;; DEPRECATED 2024-01-15: I've decided to experiment the `vertico', `consult',
;; and `embark' workflow.  I'm likely going to stick with them.

;;; Code:

;; (require-package 'helm)
;; (require-package 'helm-descbinds)
;; (require-package 'helm-bibtex)
;; (require 'bibtex-completion)

;;* Variables:

;;* Functions:

;;* Main:

(setq helm-autoresize-max-height 0)
(setq helm-autoresize-min-height 40)
(setq helm-M-x-fuzzy-match t)
(setq helm-buffers-fuzzy-matching t)
(setq helm-recentf-fuzzy-match t)
(setq helm-semantic-fuzzy-match t)
(setq helm-imenu-fuzzy-match t)
(setq helm-split-window-in-side-p nil)
(setq helm-move-to-line-cycle-in-source nil)
(setq helm-ff-search-library-in-sexp t)
(setq helm-scroll-amount 8 )
(setq helm-echo-input-in-header-line t)

(helm-mode 1)
(helm-autoresize-mode 1)

;;* Bindings:

(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-x C-b") 'helm-buffers-list)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-s") 'helm-occur)

(define-key helm-find-files-map (kbd "C-b") 'helm-find-files-up-one-level)
(define-key helm-find-files-map (kbd "C-f") 'helm-execute-persistent-action)

(global-set-key (kbd "C-c b b") 'helm-bibtex)
(global-set-key (kbd "C-c b n") 'helm-bibtex-with-notes)
(global-set-key (kbd "C-c b l") 'helm-bibtex-with-local-bibliography)

;;* Hooks:

;;* Appearance:

(diminish 'helm-mode)


(provide 'tty-nav-helm)

;;; tty-nav-helm.el ends here
