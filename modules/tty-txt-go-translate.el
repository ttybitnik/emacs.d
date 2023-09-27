;;; tty-txt-go-translate.el --- Go Translate Framework -*- lexical-binding: t -*-

;;; Commentary:

;; Go-translate related tunings.

;;; Code:

(require-package 'go-translate)

;;* Variables:

;;* Functions:

;;* Main:

(setq gts-translate-list '(("pt-br" "en")
                           ("en" "de")
                           ("en""fr")))
(setq gts-default-translator
      (gts-translator
       :picker (gts-noprompt-picker)
       :engines (list (gts-google-engine))
       :render (gts-buffer-render)))

;;* Bindings:

(global-set-key (kbd "C-c t") 'gts-do-translate)

;;* Hooks:

;;* Appearance:


(provide 'tty-txt-go-translate)

;;; tty-txt-go-translate.el ends here
