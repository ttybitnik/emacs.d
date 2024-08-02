;;; tty-func-evil.el --- Extensible Vi Layer -*- lexical-binding: t -*-

;;; Commentary:

;; Evil-related tunings.

;; References: <https://github.com/emacs-evil/evil-collection>
;;	       <https://github.com/noctuid/general.el>
;;	       <https://github.com/redguardtoo/emacs.d>

;;; Code:

;; These need to be set before loading `evil' and `evil-collection'.
(setq evil-want-keybinding nil)
(setq evil-want-integration t)
(setq evil-want-C-u-scroll t)
(setq evil-want-C-w-in-emacs-state t)

(require-package 'evil)
(require-package 'evil-collection)
(require-package 'evil-surround)
(require-package 'general)

;;* Variables:

;;* Functions:

(defun evil-window-vhsplit-and-follow/ttybitnik ()
  "Move the cursor to new split windows."
  (interactive)
  (other-window	1))

;;* Main:
(when (require 'evil-collection nil t)
  (evil-collection-init))

(evil-mode 1)
(global-evil-surround-mode 1)

(evil-set-undo-system 'undo-redo)

;;* Bindings:

(define-key evil-normal-state-map (kbd "gpf") 'project-find-file)

;; Customizations on top of `evil-collection' defaults.
(with-eval-after-load 'gnus
  (evil-define-key 'normal gnus-group-mode-map
    "c" 'gnus-topic-catchup-articles))

(evil-collection-define-key 'normal 'gnus-group-mode-map
  (kbd  "C-j") 'gnus-group-next-unread-group
  (kbd  "C-k") 'gnus-group-prev-unread-group)

(evil-collection-define-key 'normal 'gnus-summary-mode-map
  "d" 'gnus-summary-mark-as-read-forward
  "w" 'gnus-summary-browse-url
  (kbd  "<backspace>") 'gnus-summary-prev-page
  ;; TODO: Remove gX after submitting it upstream.
  "gX" 'gnus-summary-browse-url)

;; Mixed Vi & Emacs binding style (default in GNU applications).
;; Ex command
(define-key evil-ex-completion-map (kbd "C-a") 'move-beginning-of-line)
(define-key evil-ex-completion-map (kbd "C-b") 'backward-char)
(define-key evil-ex-completion-map (kbd "C-f") 'forward-char)
(define-key evil-ex-completion-map (kbd "C-d") 'delete-char)
(define-key evil-ex-completion-map (kbd "M-p") 'previous-complete-history-element)
(define-key evil-ex-completion-map (kbd "M-n") 'next-complete-history-element)
;; Normal mode
(define-key evil-normal-state-map (kbd "C-a") 'move-beginning-of-line)
(define-key evil-normal-state-map (kbd "C-e") 'move-end-of-line)
;; Insert mode
(define-key evil-insert-state-map (kbd "C-a") 'move-beginning-of-line)
(define-key evil-insert-state-map (kbd "C-e") 'move-end-of-line)
(define-key evil-insert-state-map (kbd "C-d") 'delete-char)

;; General. Frequent bindings following Emacs defaults as much as possible.
;; Use the `keyfreq' package to discover optimization areas.
(general-create-definer space/ttybitnik
  :prefix "SPC")

(space/ttybitnik
  :keymaps 'normal
  ;; C-
  "u" 'universal-argument
  "z" 'evil-emacs-state
  "." 'embark-act
  "," 'embark-dwim
  ;; M-
  "m" 'magit
  "y" 'consult-yank-pop
  ;; C-c
  "a" 'org-agenda
  "c" 'org-capture
  "d" 'dashboard-open
  "g" 'gnus
  "xj" 'org-clock-goto
  "nf" 'org-roam-node-find
  "nc" 'org-roam-capture
  ;; C-x
  "s" 'save-buffer
  "j" 'dired-jump
  "b" 'consult-buffer
  "k" 'kill-current-buffer
  "e" 'eval-last-sexp
  "pp" 'project-switch-project
  "pc" 'project-compile
  "pf" 'project-find-file)

;; * Hooks:


(add-hook 'git-commit-mode-hook 'evil-insert-state)

(advice-add 'evil-window-vsplit :after #'evil-window-vhsplit-and-follow/ttybitnik)
(advice-add 'evil-window-split :after #'evil-window-vhsplit-and-follow/ttybitnik)

;;* Appearance:

(diminish 'evil-collection-unimpaired-mode)


(provide 'tty-func-evil)

;;; tty-func-evil.el ends here
