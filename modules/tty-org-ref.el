;;; tty-org-ref.el --- Org-mode References -*- lexical-binding: t -*-

;;; Commentary:

;; Org-ref related tunings.

;; DEPRECATED 2025-12-25: Switched to `citar' for better integration with my
;; other packages (`vertico', `marginalia', `embark').

;; `org-ref' vs `citar' and `org-cite':
;;  <https://github.com/emacs-citar/citar/wiki/Comparisons>
;;  <https://github.com/jkitchin/org-ref?tab=readme-ov-file#what-about-org-cite>

;;; Code:

(require-package 'org-ref)

;;* Variables:

;;* Functions:

;;* Main:

;; Support `org-cite' syntax.
(setq org-ref-insert-cite-function (lambda () (org-cite-insert nil)))

;;* Bindings:

;; (define-key org-mode-map (kbd "C-c b i") 'org-ref-insert-link)
(define-key org-mode-map (kbd "C-c b ]") 'org-ref-insert-link-menu)

;; (global-set-key (kbd "C-c b c") 'org-ref-cite-insert-helm)

;;* Hooks:

;;* Appearance:


(provide 'tty-org-ref)

;;; tty-org-ref.el ends here
