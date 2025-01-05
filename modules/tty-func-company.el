;;; tty-func-company.el --- Company Completion Framework -*- lexical-binding: t -*-

;;; Commentary:

;; Company-mode related tunings.

;;; Code:

(require-package 'company)

;;* Variables:

;;* Functions:

(defun company-general/ttybitnik ()
  "Set up `company-mode' for general usage."
  (setq-local company-backends '((company-dabbrev
                                  company-file
                                  company-yasnippet))))

(defun company-fix-tab/ttybitnik ()
  "Fix `company-yasnippet' interaction with `yas-expand' command."
  (interactive)
  (when (null (yas-expand))
    (company-complete-common)))

;;* Main:

(setq company-global-modes #'(not eshell-mode))
(setq company-idle-delay 0.2)
(setq company-minimum-prefix-length 3)
(setq company-tooltip-align-annotations t)
(setq company-tooltip-flip-when-above t)
(setq company-search-regexp-function #'company-search-flex-regexp)
(setq company-dabbrev-ignore-case 'keep-prefix)

;; (company-tng-mode 1)

;;* Bindings:

(define-key company-active-map (kbd "C-s") 'company-filter-candidates)
(define-key company-active-map (kbd "C-M-s") 'company-search-candidates)
(define-key company-active-map (kbd "<tab>") 'company-fix-tab/ttybitnik)

;;* Hooks:

(add-hook 'after-init-hook 'company-general/ttybitnik)

;;* Appearance:


(provide 'tty-func-company)

;;; tty-func-company.el ends here
