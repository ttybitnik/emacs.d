;;; tty-prog-shell.el --- Shell Programming Languages -*- lexical-binding: t -*-

;;; Commentary:

;; Shell-related tunings.

;;; Code:

(require 'sh-script)

;;* Variables:

;;* Functions:

(defun sh-mode/ttybitnik ()
  "Set up `sh-mode' hooks."
  (yas-minor-mode)
  (flymake-mode)
  (eglot-ensure)
  (sh-format-on-save-mode))

;;* Main:

(reformatter-define sh-format
  :program "shfmt"
  :args `("--indent" ,(number-to-string sh-basic-offset)
          "--func-next-line"
          "--binary-next-line"
          "--case-indent"
          "--keep-padding")
  :mode t)

;;* Bindings:

;;* Hooks:

(add-hook 'sh-mode-hook 'sh-mode/ttybitnik)

;;* Appearance:


(provide 'tty-prog-shell)

;;; tty-prog-shell.el ends here
