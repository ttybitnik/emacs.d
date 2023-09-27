;;; tty-prog-toml.el --- Tom's Obvious, Minimal Language -*- lexical-binding: t -*-

;;; Commentary:

;; TOML-related tunings.

;;; Code:

(require 'conf-mode)

;;* Variables:

;;* Functions:

(defun company-conf-toml-mode/ttybitnik ()
  "Set up `company-mode' for `conf-toml-mode'."
  (setq-local company-minimum-prefix-length 1)
  (setq-local company-backends '((company-capf
                                  company-dabbrev-code
                                  company-keywords
                                  company-files
                                  company-yasnippet))))

;;* Main:

(setq lsp-toml-command "~/.cargo/bin/taplo")

;;* Bindings:

;;* Hooks:

(add-hook 'conf-toml-mode-hook (lambda ()
				 (yas-minor-mode)
				 (flycheck-mode)
				 (company-mode)
				 (lsp-deferred)
				 (company-conf-toml-mode/ttybitnik)))

;;* Appearance:


(provide 'tty-prog-toml)

;;; tty-prog-toml.el ends here
