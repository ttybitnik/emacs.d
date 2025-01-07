;;; tty-prog-rust.el --- Rust Programming Language -*- lexical-binding: t -*-

;;; Commentary:

;; Rust-related tunings.

;;; Code:

(require-package 'rust-mode)

;;* Variables:

;;* Functions:

;;* Main:

;;* Bindings:

;;* Hooks:

(add-hook 'rust-mode-hook (lambda ()
                            (yas-minor-mode)
                            (flymake-mode)
                            (eglot-ensure)))

;;* Appearance:


(provide 'tty-prog-rust)

;;; tty-prog-rust.el ends here
