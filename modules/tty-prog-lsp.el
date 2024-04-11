;;; tty-prog-lsp.el --- Language Server Protocol -*- lexical-binding: t -*-

;;; Commentary:

;; LSP-related tunings.

;; Optional packages that I'm currently not using:
;; (require-package 'lsp-treemacs)
;; (autoload 'lsp-treemacs-errors-list "lsp-treemacs" nil t)

;; Check LSP documentation for setting debuggers:
;; (require-package dap-mode)
;; (require-package dap-LANGUAGE)

;; DEPRECATED 2024-01-14: Since `eglot' is now built-in Emacs, I've decided to
;; switch to it.

;;; Code:

(require-package 'lsp-mode)
(require-package 'lsp-ui)
;; (require-package 'helm-lsp)
(require-package 'consult-lsp)

;;* Variables:

;;* Functions:

;;* Main:

(autoload 'lsp "lsp-mode" nil t)
(autoload 'lsp-deferred "lsp-mode" nil t)
(autoload 'lsp-ui-mode "lsp-ui" nil t)
;; (autoload 'helm-lsp-workspace-symbol "helm-lsp" nil t)

;;* Bindings:

(setq lsp-keymap-prefix "C-c s")
(define-key lsp-mode-map (kbd "C-c s") lsp-command-map)
(define-key lsp-mode-map [remap xref-find-apropos] #'consult-lsp-symbols)

;;* Hooks:

(add-hook 'lsp-mode-hook 'lsp-enable-which-key-integration)

;;* Appearance:


(provide 'tty-prog-lsp)

;;; tty-prog-lsp.el ends here
