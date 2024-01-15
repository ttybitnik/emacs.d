;;; tty-func-vundo.el --- Visual Undo -*- lexical-binding: t -*-

;;; Commentary:

;; Visual-undo related tunings.

;;; Code:

(require-package 'vundo)

;;* Variables:

;;* Functions:

;;* Main:

;; (setq vundo-glyph-alist vundo-unicode-symbols)
;; (setq vundo-roll-back-on-quit nil)

;;* Bindings:

(define-key global-map (kbd "C-x u") 'vundo)

;;* Hooks:

;;* Appearance:

(custom-set-faces
 '(vundo-last-saved ((t (:inherit vundo-saved :underline t :weight bold))))
 '(vundo-saved ((t (:inherit vundo-highlight)))))


(provide 'tty-func-vundo)

;;; tty-func-vundo.el ends here
