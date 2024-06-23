;;; tty-txt-go-translate.el --- Go Translate Framework -*- lexical-binding: t -*-

;;; Commentary:

;; Go-translate related tunings.

;;; Code:

(require-package 'go-translate)

;;* Variables:

;;* Functions:

;;* Main:

(setq gt-langs '(en pt-br de fr))
(setq gt-default-translator
      (gt-translator
       :taker (gt-taker :text 'word)
       :engines (gt-google-engine)
       :render (gt-buffer-render)))

;;* Bindings:

(global-set-key (kbd "C-c t") 'gt-do-translate)

;;* Hooks:

;;* Appearance:


(provide 'tty-txt-go-translate)

;;; tty-txt-go-translate.el ends here
