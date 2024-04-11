;;; tty-prog-lua.el --- Lua Programming Language -*- lexical-binding: t -*-

;;; Commentary:

;; Lua-related tunings.

;;; Code:

;;* Variables:

;;* Functions:

(defun company-lua-mode/ttybitnik ()
  "Set up `company-mode' for `lua-mode'."
  (setq-local company-minimum-prefix-length 1)
  (setq-local company-backends '((company-capf
                                  company-dabbrev-code
                                  company-keywords
                                  company-files
                                  company-yasnippet))))

;;* Main:

(require-package 'lua-mode)

;;* Bindings:

;;* Hooks:

(add-hook 'lua-mode-hook (lambda ()
                          (yas-minor-mode)
                          (flymake-mode)
                          (company-mode)
                          (eglot-ensure)
                          (company-lua-mode/ttybitnik)))

;;* Appearance:


(provide 'tty-prog-lua)

;;; tty-prog-lua.el ends here
