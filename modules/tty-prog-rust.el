;;; tty-prog-rust.el --- Rust Programming Language -*- lexical-binding: t -*-

;;; Commentary:

;; Rust-related tunings.

;;; Code:

(require-package 'rust-mode)

;;* Variables:

;;* Functions:

(defun rust-mode/ttybitnik ()
  "Set up `rust-mode' hooks."
  (yas-minor-mode)
  (flymake-mode)
  (eglot-ensure))

;;* Main:

;;* Bindings:

;;* Hooks:

(add-hook 'rust-mode-hook 'rust-mode/ttybitnik)

;;* Appearance:


(provide 'tty-prog-rust)

;;; tty-prog-rust.el ends here
