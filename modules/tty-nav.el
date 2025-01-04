;;; tty-nav.el --- Navigation Module -*- lexical-binding: t -*-

;;; Commentary:

;; This module tailors settings and packages for navigation in Emacs.

;;; Code:
;; (require 'tty-nav-avy)
;; (require 'tty-nav-helm)
;; (require 'tty-nav-switch-window)

(require 'tty-nav-consult)
(require 'tty-nav-embark)
(require 'tty-nav-evil)
(require 'tty-nav-vertico)

;;* Variables:

;;* Functions:

(defun split-and-follow-horizontally ()
  "Split the window horizontally and move to it."
  (interactive)
  (split-window-below)
  (balance-windows)
  (other-window 1))

(defun split-and-follow-vertically ()
  "Split the window vertically and move to it."
  (interactive)
  (split-window-right)
  (balance-windows)
  (other-window 1))

(defun kill-current-buffer ()
  "Kill the current buffer."
  (interactive)
  (kill-buffer (current-buffer)))

(defun close-all-buffers ()
  "Kill all buffers without regard for their origin."
  (interactive)
  (mapc 'kill-buffer (buffer-list)))

(defun previous-multilines ()
  "Scroll down multiple lines, `universal-argument' moves the `next-window'."
  (interactive)
  (if current-prefix-arg
      (with-selected-window (next-window)
        (ccm-scroll-down (/ (window-body-height) 3)))
    (ccm-scroll-down (/ (window-body-height) 3))))

(defun next-multilines ()
  "Scroll up multiple lines, `universal-argument' moves the `next-window'."
  (interactive)
  (if current-prefix-arg
      (with-selected-window (next-window)
        (ccm-scroll-up (/ (window-body-height) 3)))
    (ccm-scroll-up (/ (window-body-height) 3))))

;;* Main:

(setq scroll-conservatively 100)
;; (setq ibuffer-expert 1)

(setq kill-buffer-query-functions
      (delq 'process-kill-buffer-query-function kill-buffer-query-functions))

;;* Bindings:

;; (global-set-key (kbd "C-x C-b") 'ibuffer)

(global-set-key (kbd "C-x 2") 'split-and-follow-horizontally)
(global-set-key (kbd "C-x 3") 'split-and-follow-vertically)
(global-set-key (kbd "C-x k") 'kill-current-buffer)
(global-set-key (kbd "C-M-s-k") 'close-all-buffers)

(global-set-key "\M-p" 'previous-multilines)
(global-set-key "\M-n" 'next-multilines)

;;* Hooks:

;;* Appearance:


(provide 'tty-nav)

;;; tty-nav.el ends here
