;;; tty-misc-centered-cursor.el --- Centered Cursor -*- lexical-binding: t -*-

;;; Commentary:

;; Centered-cursor related tunings.

;;; Code:

(require-package 'centered-cursor-mode)

;;* Variables:

;;* Functions:

;;* Main:

(global-centered-cursor-mode 1)

;;* Bindings:

;;* Hooks:

(add-hook 'window-configuration-change-hook
          (lambda ()
            (unless (derived-mode-p 'erc-mode)
              (recenter))))

;;* Appearance:


(provide 'tty-misc-centered-cursor)

;;; tty-misc-centered-cursor.el ends here
