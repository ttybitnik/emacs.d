;;; tty-nav-consult.el --- Consult Completing-read -*- lexical-binding: t -*-

;;; Commentary:

;; Consult-related tunings.

;;; Code:

(require-package 'consult)
(require-package 'consult-eglot)

;;* Variables:

;;* Functions:

;;* Main:

(setq xref-show-xrefs-function #'consult-xref)
(setq xref-show-definitions-function #'consult-xref)

(setq consult-narrow-key "<")

;;* Bindings:

(global-set-key (kbd "C-s") 'consult-line)
(global-set-key (kbd "C-S-s") 'consult-line-multi)
(global-set-key (kbd "M-y") 'consult-yank-pop)

(global-set-key (kbd "C-x b") 'consult-buffer)
(global-set-key (kbd "C-x C-b") 'consult-buffer)
(global-set-key (kbd "C-x b") 'consult-buffer-other-window)
(global-set-key (kbd "C-x 5 b") 'consult-buffer-other-frame)
(global-set-key (kbd "C-x t b") 'consult-buffer-other-tab)
(global-set-key (kbd "C-x r b") 'consult-bookmark)
(global-set-key (kbd "C-x p b") 'consult-project-buffer)

(global-set-key (kbd "C-c s M-x") 'consult-mode-command)
(global-set-key (kbd "C-c s k") 'consult-kmacro)
(global-set-key (kbd "C-c s m") 'consult-man)
(global-set-key (kbd "C-c s i") 'consult-info)
(global-set-key (kbd "C-c s g") 'consult-grep)
(global-set-key (kbd "C-c s r") 'consult-ripgrep)
(global-set-key (kbd "C-c s f") 'consult-find)
(global-set-key (kbd "C-c s l") 'consult-locate)
(global-set-key (kbd "C-c s K") 'consult-keep-lines)
(global-set-key (kbd "C-c s F") 'consult-focus-lines)
(global-set-key [remap Info-search] 'consult-info)

(global-set-key (kbd "M-#") 'consult-register-load)
(global-set-key (kbd "M-'") 'consult-register-store)
(global-set-key (kbd "C-M-#") 'consult-register)

(global-set-key (kbd "M-g a") 'consult-org-agenda)
(global-set-key (kbd "M-g h") 'consult-complex-command)
(global-set-key (kbd "M-g e") 'consult-compile-error)
(global-set-key (kbd "M-g f") 'consult-flymake)
(global-set-key (kbd "M-g g") 'consult-goto-line)
(global-set-key (kbd "M-g M-g") 'consult-goto-line)
(global-set-key (kbd "M-g o") 'consult-outline)
(global-set-key (kbd "M-g m") 'consult-mark)
(global-set-key (kbd "M-g M") 'consult-minor-mode-menu)
(global-set-key (kbd "M-g k") 'consult-global-mark)
(global-set-key (kbd "M-g i") 'consult-imenu)
(global-set-key (kbd "M-g I") 'consult-imenu-multi)

(define-key minibuffer-local-map (kbd "M-s") 'consult-history)
(define-key org-mode-map (kbd "M-g o") 'consult-org-heading)

;;* Hooks:

;;* Appearance:


(provide 'tty-nav-consult)

;;; tty-nav-consult.el ends here
