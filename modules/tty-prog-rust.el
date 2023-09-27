;;; tty-prog-rust.el --- Rust Programming Language -*- lexical-binding: t -*-

;;; Commentary:

;; Rust-related tunings.

;;; Code:

(require-package 'rust-mode)

;;* Variables:

;;* Functions:

(defun company-rust-mode/ttybitnik ()
  "Set up `company-mode' for `rust-mode'."
  (setq-local company-minimum-prefix-length 1)
  (setq-local company-backends '((company-capf
                                  company-dabbrev-code
                                  company-keywords
                                  company-files
                                  company-yasnippet))))

;;* Main:

;;* Bindings:

;;* Hooks:

(add-hook 'rust-mode-hook (lambda ()
                            (yas-minor-mode)
                            (flycheck-mode)
                            (company-mode)
                            (lsp-deferred)
                            (company-rust-mode/ttybitnik)))

;;* Appearance:


(provide 'tty-prog-rust)

;;; tty-prog-rust.el ends here
