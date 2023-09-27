;;; tty-vis-keycast.el --- Keycast -*- lexical-binding: t -*-

;;; Commentary:

;; Keycast-related tunings.

;;; Code:

(require-package 'keycast)

;;* Variables:

;;* Functions:

;;* Main:

(setq keycast-mode-line-format "%3s%k%c%r%3s")

(defalias 'keycast-mode 'keycast-mode/ttybitnik)

(define-minor-mode keycast-mode/ttybitnik
  "Show current command and its key binding in the mode line.
This is a reimplementation of `keycast-mode' for use by users
of the `spaceline' package."
  :global t
  (if keycast-mode/ttybitnik
      (progn
	  (add-to-list 'global-mode-string 'keycast-mode-line)
	  (add-hook 'pre-command-hook 'keycast--update t)
	  (keycast-mode-line-mode))
    (remove-hook 'pre-command-hook 'keycast--update)
    (setq global-mode-string (remove 'keycast-mode-line global-mode-string))))

;;* Bindings:

;;* Hooks:

;;* Appearance:


(provide 'tty-vis-keycast)

;;; tty-vis-keycast.el ends here
