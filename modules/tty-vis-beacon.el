;;; tty-vis-beacon.el --- Beacon Cursor Highlight -*- lexical-binding: t -*-

;;; Commentary:

;; Beacon-related tunings.

;; DEPRECATED 2024-04-10: I've switched to `pulsar'.

;;; Code:

(require-package 'beacon)

;;* Variables:

;;* Functions:

;;* Main:

(beacon-mode 1)

;;* Bindings:

;;* Hooks:

;;* Appearance:

(diminish 'beacon-mode)


(provide 'tty-vis-beacon)

;;; tty-vis-beacon.el ends here
