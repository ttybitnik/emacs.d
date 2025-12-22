;;; tty-prog-toml.el --- Tom's Obvious, Minimal Language -*- lexical-binding: t -*-

;;; Commentary:

;; TOML-related tunings.

;;; Code:

(require 'conf-mode)

;;* Variables:

;;* Functions:

(defun conf-toml-mode/ttybitnik ()
  "Set up `conf-toml-mode' hooks."
  (yas-minor-mode)
  (flymake-mode)
  (eglot-ensure))

;;* Main:

(setq lsp-toml-command "~/.cargo/bin/taplo")

;;* Bindings:

;;* Hooks:

(add-hook 'conf-toml-mode-hook 'conf-toml-mode/ttybitnik)

;;* Appearance:


(provide 'tty-prog-toml)

;;; tty-prog-toml.el ends here
