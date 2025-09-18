;;; tty-prog.el --- Programming Module -*- lexical-binding: t -*-

;;; Commentary:

;; This module tailors settings and packages for programming in Emacs.

;;; Code:
;; (require 'tty-prog-flycheck)
;; (require 'tty-prog-lsp)

(require 'ansi-color)

(require 'tty-prog-eglot)
(require 'tty-prog-flymake)
(require 'tty-prog-reformatter)
(require 'tty-prog-tree-sitter)
(require 'tty-prog-yasnippet)

(require 'tty-prog-ansible)
(require 'tty-prog-c)
(require 'tty-prog-css)
(require 'tty-prog-elm)
(require 'tty-prog-go)
(require 'tty-prog-haskell)
(require 'tty-prog-html)
(require 'tty-prog-javascript)
(require 'tty-prog-json)
(require 'tty-prog-lisp)
(require 'tty-prog-markdown)
(require 'tty-prog-python)
(require 'tty-prog-rust)
(require 'tty-prog-scheme)
(require 'tty-prog-shell)
(require 'tty-prog-sql)
(require 'tty-prog-toml)
(require 'tty-prog-xml)
(require 'tty-prog-yaml)

;;* Variables:

;;* Functions:

(defun fill-column/ttybitnik (&optional value)
  "Set `fill-column' to VALUE or default to 80, and enable indicator."
  (setq-local fill-column (if (numberp value) value 80))
  (display-fill-column-indicator-mode))

(defun highlight-regexp-globally/ttybitnik ()
  "Highlight specific regexp globally using `highlight-regexp'.
This function is intended to be used as a hook for specific
modes (e.g., `prog-mode-hook', `conf-mode-hook')."
  (highlight-regexp "\\<TODO\\(\([A-z0-9_-]*\)\\)?" 'hi-green)
  (highlight-regexp "\\<FIXME\\(\([A-z0-9_-]*\)\\)?" 'hi-yellow)
  (highlight-regexp "\\<changeme" 'hi-red-b))

;;* Main:

(setq compilation-scroll-output t)

(setq copyright-names-regexp "\\(Vinícius Moraes\\|5bits\\.one\\)")

;;* Bindings:

(global-set-key (kbd "<f5>") 'compile)
(global-set-key (kbd "C-c r") 'recompile)

;;* Hooks:

(add-hook 'prog-mode-hook 'fill-column/ttybitnik)
(add-hook 'prog-mode-hook 'highlight-regexp-globally/ttybitnik)

(add-hook 'conf-mode-hook 'fill-column/ttybitnik)
(add-hook 'conf-mode-hook 'highlight-regexp-globally/ttybitnik)

(add-hook 'diff-mode-hook 'fill-column/ttybitnik)

(add-hook 'before-save-hook 'copyright-update)
(add-hook 'compilation-filter-hook 'ansi-color-compilation-filter)

;;* Appearance:


(provide 'tty-prog)

;;; tty-prog.el ends here
