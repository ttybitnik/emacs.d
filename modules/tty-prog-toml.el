;;; tty-prog-toml.el --- Tom's Obvious, Minimal Language -*- lexical-binding: t -*-

;;; Commentary:

;; TOML-related tunings.

;;; Code:

(require 'conf-mode)

;;* Variables:

;;* Functions:

;;* Main:

(setq lsp-toml-command "~/.cargo/bin/taplo")

;;* Bindings:

;;* Hooks:

(add-hook 'conf-toml-mode-hook (lambda ()
				 (yas-minor-mode)
				 (flymake-mode)
				 (eglot-ensure)))

;;* Appearance:


(provide 'tty-prog-toml)

;;; tty-prog-toml.el ends here
