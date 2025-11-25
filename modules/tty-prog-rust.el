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

;; TODO: Well, below seems to not work via TRAMP. So, perhaps, use `reformatter'.
;; Seems like `reformatter' is not necessary.
(setq rust-format-on-save t)

;;* Bindings:

;;* Hooks:

(add-hook 'rust-mode-hook 'rust-mode/ttybitnik)

;;* Appearance:


(provide 'tty-prog-rust)

;;; tty-prog-rust.el ends here
