;;; tty-misc-centered-cursor.el --- Centered Cursor -*- lexical-binding: t -*-

;;; Commentary:

;; Centered-cursor related tunings.

;; DEPRECATED 2026-08-06: Removing this as eye fatigue precaution and
;; performance concerns.  The constant centering caused a bit of visual strain
;; from staring at the same screen position and introduced unnecessary overhead.

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
