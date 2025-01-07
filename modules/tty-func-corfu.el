;;; tty-func-corfu.el --- COmpletion in Region FUnction -*- lexical-binding: t -*-

;;; Commentary:

;; Corfu-mode related tunings.

;;; Code:

(require-package 'corfu)
(require-package 'cape)
(require 'dabbrev)

;;* Variables:

;;* Functions:

;;* Main:

;; (setq globalocorfu-modes '(text-mode prog-mode))
(setq tab-always-indent 'complete)
(setq corfu-cycle t)
(setq corfu-preview-current nil)
(setq corfu-auto t)
(setq corfu-auto-delay 0.3)
(setq corfu-auto-prefix 3)
(setq corfu-preselect 'valid)
(setq corfu-on-exact-match nil)

(setq cape-dabbrev-check-other-buffers t)

(add-to-list 'dabbrev-ignored-buffer-modes 'pdf-view-mode)

;;* Bindings:

(define-key corfu-map (kbd "C-s") 'corfu-insert-separator)

;;* Hooks:

(add-hook 'after-init-hook 'global-corfu-mode)
(add-hook 'corfu-mode-hook 'corfu-popupinfo-mode)

;; Controlling different backends directly via `lambda'. It's possible to
;; merge them with `cape-wrap-super', but I didn't find it necessary.
(add-hook 'prog-mode-hook
          (lambda ()
            (add-hook 'completion-at-point-functions #'cape-file -10 t)
            (add-hook 'completion-at-point-functions #'cape-dabbrev 20 t)
            (add-hook 'completion-at-point-functions #'cape-dict 30 t)))

(add-hook 'text-mode-hook
          (lambda ()
            (add-hook 'completion-at-point-functions #'cape-dabbrev 20 t)
            (add-hook 'completion-at-point-functions #'cape-dict 30 t)))

(add-hook 'org-mode-hook
          (lambda ()
            (add-hook 'completion-at-point-functions #'cape-elisp-block 0 t)))
(add-hook 'markdown-mode-hook
          (lambda ()
            (add-hook 'completion-at-point-functions #'cape-elisp-block 0 t)))

(add-hook 'conf-mode-hook
          (lambda ()
            (add-hook 'completion-at-point-functions #'cape-file -10 t)
            (add-hook 'completion-at-point-functions #'cape-dabbrev 20 t)
            (add-hook 'completion-at-point-functions #'cape-dict 30 t)))

(add-hook 'comint-mode-hook
          (lambda ()
            (add-hook 'completion-at-point-functions #'cape-dabbrev 20 t)
            (add-hook 'completion-at-point-functions #'cape-dict 30 t)))

(advice-add #'comint-completion-at-point :around #'cape-wrap-nonexclusive)
(advice-add #'eglot-completion-at-point :around #'cape-wrap-nonexclusive)
(advice-add #'pcomplete-completions-at-point :around #'cape-wrap-nonexclusive)

;;* Appearance:


(provide 'tty-func-corfu)

;;; tty-func-corfu.el ends here
