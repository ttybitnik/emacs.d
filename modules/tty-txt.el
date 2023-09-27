;;; tty-txt.el --- Text Module -*- lexical-binding: t -*-

;;; Commentary:

;; This module tailors settings and packages for text-related crafts in Emacs.

;;; Code:

(require 'tty-txt-flyspell)
(require 'tty-txt-fountain)
(require 'tty-txt-go-translate)

;;* Variables:

;;* Functions:

(defun kill-inner-word/daedreth ()
  "Kill the entire word your cursor is in.  Equivalent to 'ciw' in vim."
  (interactive)
  (forward-char 1)
  (backward-word)
  (kill-word 1))

(defun copy-whole-word/daedreth ()
  "Copy a word at the cursor position."
  (interactive)
  (save-excursion
    (forward-char 1)
    (backward-word)
    (kill-word 1)
    (yank)))

(defun copy-whole-line/daedreth ()
  "Copy a line without regard for cursor position."
  (interactive)
  (save-excursion
    (kill-new
     (buffer-substring
      (point-at-bol)
      (point-at-eol)))))

;;* Main:

;;* Bindings:

(global-set-key (kbd "C-c l c") 'copy-whole-line/daedreth)
(global-set-key (kbd "C-c w c") 'copy-whole-word/daedreth)
(global-set-key (kbd "C-c l k") 'kill-whole-line)
(global-set-key (kbd "C-c w k") 'kill-inner-word/daedreth)

;;* Hooks:

;;* Appearance:


(provide 'tty-txt)

;;; tty-txt.el ends here
