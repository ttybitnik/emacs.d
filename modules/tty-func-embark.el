;;; tty-func-embark.el --- Emacs Mini-Buffer Actions Rooted in Keymaps -*- lexical-binding: t -*-

;;; Commentary:

;; Embark-related tunings.

;; Run `embark-keymap-alist' to list target candidates key maps for extending
;; available commands.

;;; Code:

(require-package 'embark)
(require-package 'embark-consult)

;;* Variables:

;;* Functions:

;;* Main:

;; (setq embark-mixed-indicator-delay 0.5)
(setq prefix-help-command #'embark-prefix-help-command)

;;* Bindings:

(define-key global-map (kbd "C-,") 'embark-dwim)
(define-key global-map (kbd "C-.") 'embark-act)
(define-key global-map (kbd "C-h B") 'embark-bindings)

;; (add-to-list 'display-buffer-alist
;;                '("\\`\\*Embark Collect \\(Live\\|Completions\\)\\*"
;;                  nil
;;                  (window-parameters (mode-line-format . none))))


;;* Hooks:

(add-hook 'embark-collect-mode-hook 'consult-preview-at-point-mode)

;;* Appearance:


(provide 'tty-func-embark)

;;; tty-func-embark.el ends here
