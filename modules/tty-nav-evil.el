;;; tty-nav-evil.el --- Extensible Vi Layer -*- lexical-binding: t -*-

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

(evil-set-initial-state 'easy-hugo-mode 'emacs)
(evil-set-initial-state 'erc-mode 'normal)
(evil-set-initial-state 'org-agenda-mode 'motion)

;;* Bindings:

(define-key evil-normal-state-map (kbd "gpf") 'project-find-file)
(define-key evil-normal-state-map (kbd "gh") 'display-local-help)

;; Customizations on top of `evil-collection' defaults.
(evil-collection-define-key 'normal 'gnus-group-mode-map
  "c"	'gnus-topic-catchup-articles
  ;; TODO: Remove after submitting it upstream.
  (kbd "M-S") 'gnus-group-make-search-group)

;; TODO: Remove after submitting this fix upstream.
(evil-collection-define-key 'normal 'gnus-topic-mode-map
  "dd"	'gnus-topic-kill-group
  "D"	'gnus-topic-kill-group
  "p"	'gnus-topic-yank-group
  "P"   'gnus-topic-yank-group
  (kbd "RET")	'gnus-topic-select-group)

(evil-collection-define-key 'normal 'gnus-summary-mode-map
  "d" 'gnus-summary-mark-as-read-forward
  "w" 'gnus-summary-browse-url
  (kbd  "<backspace>") 'gnus-summary-prev-page
  ;; TODO: Remove after submitting it upstream.
  "gs" 'gnus-summary-set-score
  "gS" 'gnus-summary-current-score
  "gP" 'gnus-summary-refer-references		;; default suffix was "R"
  "gt" 'gnus-score-find-trace
  "gc" 'gnus-score-change-score-file
  "gC" 'gnus-score-edit-current-scores		;; default suffix was "e"
  "gb" 'gnus-score-set-mark-below		;; default suffix was "m"
  "gH" 'gnus-article-browse-html-article)

;; TODO: Remove after submitting it upstream.
(evil-collection-define-key 'normal 'gnus-article-mode-map
  "gH" 'gnus-article-browse-html-article)

(evil-collection-define-key nil 'vertico-map
  (kbd  "C-j") 'vertico-next
  (kbd  "C-k") 'vertico-previous)

;; TODO: Remove after submitting it upstream but C-S-k and C-S-j.
(evil-collection-define-key 'normal 'compilation-mode-map
  "go" 'compile-goto-error
  "gO" 'compilation-display-error
  (kbd "S-<return>") 'compile-goto-error
  (kbd "M-<return>") 'compilation-display-error
  (kbd  "C-S-k") 'next-error-no-select
  (kbd  "C-S-j") 'previous-error-no-select)

;; TODO: Remove C-S-k and C-S-j after submitting it upstream.
;; https://github.com/LuigiPiucco/doom-emacs/blob/master/modules/completion/corfu/README.org#cycle-directionally
(evil-collection-define-key 'insert 'corfu-map
  (kbd  "C-S-k") 'corfu-popupinfo-scroll-down
  (kbd  "C-S-j") 'corfu-popupinfo-scroll-up)

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
  "SPC" 'evil-buffer
  ;; M-
  "m" 'magit
  "y" 'consult-yank-pop
  ;; C-c
  "a" 'org-agenda
  "c" 'org-capture
  "d" 'dashboard-open
  "g" 'gnus
  "h" 'easy-hugo
  "ii" 'erc-login/ttybitnik
  "ib" 'erc-track-switch-buffer
  "id" 'erc-minimal-distraction/ttybitnik
  "xj" 'org-clock-goto
  "nf" 'org-roam-node-find
  "nc" 'org-roam-capture
  "nn" 'org-roam-buffer-toggle
  "ls" 'org-store-link
  "li" 'org-insert-link
  "ll" 'org-insert-last-stored-link
  ;; C-x
  "s" 'save-buffer
  "j" 'dired-jump
  "b" 'consult-buffer
  "k" 'kill-current-buffer
  "e" 'eval-last-sexp
  "pp" 'project-switch-project
  "pc" 'project-compile
  "pf" 'project-find-file)

;; Bindings for `org-agenda-mode' as `evil-collection' doesn't provide any.
;; TODO: Maybe submit this upstream if there's interest.
(evil-define-key 'motion org-agenda-mode-map
  ;; Motion
  "j"		'org-agenda-next-line
  "k"		'org-agenda-previous-line
  "gj"		'org-agenda-next-item
  "gk"		'org-agenda-previous-item
  (kbd "C-j")	'org-agenda-next-item
  (kbd "C-k")	'org-agenda-previous-item
  "}"		'evil-forward-paragraph	 ;; overwrites `org-agenda-manipulate-query-subtract-re'
  "{"		'evil-backward-paragraph ;; overwrites `org-agenda-manipulate-query-add-re'
  "]]"  	'org-agenda-earlier
  "[["  	'org-agenda-later

  ;; Bulk (marking)
  "gm"		'org-agenda-bulk-mark     ;; default "m" also works, overwrites `evil-middle-of-visual-line'
  "g*"		'org-agenda-bulk-mark-all ;; overwrites `evil-search-unbounded-word-forward'
  "gu"		'org-agenda-bulk-unmark
  "gU"		'org-agenda-bulk-unmark-all
  "gb"		'org-agenda-bulk-action

  ;; Items
  "ct"		'org-agenda-todo
  "cq"		'org-agenda-set-tags
  "cs"		'org-agenda-schedule
  "cd"		'org-agenda-deadline
  "cw"		'org-agenda-refile
  "ca"		'org-agenda-archive-default-with-confirmation ;; default "a" also works
  "ce"		'org-agenda-priority
  (kbd "M-k")	'org-agenda-priority-up
  (kbd "M-j")	'org-agenda-priority-down
  (kbd "M-l")	'org-agenda-date-later
  (kbd "M-h")	'org-agenda-date-earlier
  (kbd "M-S-l")	'org-agenda-todo-nextset
  (kbd "M-S-h")	'org-agenda-todo-previousset
  "cI" 		'org-agenda-clock-in	 ;; default "I" also works
  "cO" 		'org-agenda-clock-out	 ;; default "O" also works
  "cX" 		'org-agenda-clock-cancel ;; default "X" also works

  ;; Navigation
  "g."		'org-agenda-goto-today
  "gJ"		'org-agenda-clock-goto
  "gc"		'org-agenda-goto-calendar
  "gz"		'org-agenda-recenter

  ;; Actions
  (kbd  "RET")	'org-agenda-switch-to
  "dd" 		'org-agenda-kill
  "u"	 	'evil-undo ;; overwrites `org-agenda-undo', default "C-_" still works
  "r"	 	'evil-redo ;; overwrites `org-agenda-redo'
  "gr" 		'org-agenda-redo-all
  "gs"		'org-save-all-org-buffers ;; default "s" also works
  "gi" 		'org-agenda-diary-entry	  ;; default "i" also works

  ;; Display
  "zd"		'org-agenda-day-view
  "zw"		'org-agenda-week-view
  "zm"		'org-agenda-month-view
  "zv"	 	'org-agenda-view-mode-dispatch
  "zr"		'org-agenda-reset-view
  "z/"		'org-agenda-filter
  "zff"		'org-agenda-filter
  "zfq"		'org-agenda-filter-by-tag
  "zfe"		'org-agenda-filter-by-effort
  "zfr"		'org-agenda-filter-by-regexp
  "zfc"		'org-agenda-filter-by-category
  "zfh"		'org-agenda-filter-by-top-headline
  "zfx"		'org-agenda-filter-remove-all
  "zF" 		'org-agenda-follow-mode
  "zR" 		'org-agenda-clockreport-mode
  "zE" 		'org-agenda-entry-text-mode
  "zG" 		'org-agenda-log-mode
  "zM" 		'org-agenda-phases-of-moon
  "zS" 		'org-agenda-sunrise-sunset
  "zO" 		'org-agenda-holidays
  "zG" 		'org-agenda-toggle-time-grid
  "z!" 		'org-agenda-toggle-deadlines
  "z~" 		'org-agenda-limit-interactively
  "z?" 		'org-agenda-show-the-flagging-note

  ;; Quit
  "q"		'org-agenda-quit
  "ZZ"		'org-agenda-quit
  "ZQ"		'org-agenda-exit)

;; * Hooks:

(add-hook 'git-commit-mode-hook 'evil-insert-state)
(add-hook 'org-capture-mode-hook 'evil-insert-state)

(advice-add 'evil-window-vsplit :after #'evil-window-vhsplit-and-follow/ttybitnik)
(advice-add 'evil-window-split :after #'evil-window-vhsplit-and-follow/ttybitnik)

;;* Appearance:


(provide 'tty-nav-evil)

;;; tty-nav-evil.el ends here
