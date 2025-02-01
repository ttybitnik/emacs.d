;;; tty-prog-yaml.el --- YAML Ain't Markup Language -*- lexical-binding: t -*-

;;; Commentary:

;; YAML-related tunings.

;;; Code:

(require-package 'yaml-mode)

;;* Variables:

;;* Functions:

;;* Main:

;;* Bindings:

;;* Hooks:

(add-hook 'yaml-mode-hook (lambda ()
			    (display-line-numbers-mode)
			    (fill-column/ttybitnik)
                            (yas-minor-mode)
                            (flymake-mode)
                            (eglot-ensure)))

;;* Appearance:


(provide 'tty-prog-yaml)

;;; tty-prog-yaml.el ends here
