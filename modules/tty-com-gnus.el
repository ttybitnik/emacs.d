;;; tty-com-gnus.el --- Gnus Network User Services -*- lexical-binding: t -*-

;;; Commentary:

;; GNUS-related tunings.

;; Useful options currently not being used:
;; (setq gnus-summary-ignore-duplicates t)
;; (setq gnus-suppress-duplicates t)
;; (setq gnus-save-duplicate-list t)
;; (setq gnus-use-cache t) many disk w operations, see the info man
;; (setq message-citation-line-function nil)
;; (setq message-ignored-cited-headers nil)
;; (setq gnus-save-newsrc-file nil)

;;; Code:

(require-package 'gnus)

;;* Variables:

;;* Functions:

;;* Main:

;; (setq gnus-novice-user nil)
(setq gnus-interactive-exit nil)
(setq gnus-gcc-mark-as-read t)
(setq gnus-agent t)
(setq gnus-read-active-file 'some)
(setq gnus-check-new-newsgroups nil)
(setq gnus-save-killed-list nil)
(setq gnus-ignored-newsgroups "^to\\.\\|^[0-9. ]+\\( \\|$\\)\\|^[\"]\"[#'()]")
(setq gnus-auto-select-first t)
(setq gnus-auto-select-subject 'best)
(setq gnus-keep-same-level t)
(setq gnus-search-use-parsed-queries t)

(setq gnus-agent-article-alist-save-format 1)
(setq gnus-agent-cache t)
(setq gnus-agent-confirmation-function 'y-or-n-p)
(setq gnus-agent-consider-all-articles nil)
(setq gnus-agent-directory "~/News/agent/")
(setq gnus-agent-enable-expiration 'ENABLE)
(setq gnus-agent-expire-days 30)
(setq gnus-agent-mark-unread-after-downloaded t)
(setq gnus-agent-queue-mail t)
(setq gnus-agent-synchronize-flags nil)

(setq mm-verify-option 'always)
(setq mm-decrypt-option 'always)
(setq mm-sign-option 'guided)
(setq message-cite-reply-position 'below)
;; Setting `gnus-posting-styles' privately.

;; Server
(setq gnus-select-method '(nnnil ""))
;; Setting `gnus-secondary-select-methods' privately.

;; Group
(setq gnus-group-line-format "%M%p%P%5y:%B%(%g%)\n")
(setq gnus-parameters
      '(("^nnimap"
         (gnus-show-threads nil)
	 (display . all))
	("^nntp"
         (gnus-use-adaptive-scoring t)
	 (gnus-decay-scores t))))

;; Using `gnus-parameters' since I'm  disabling adaptive scoring for email.
;; (setq gnus-use-adaptive-scoring t)
;; (setq gnus-decay-scores t)
;; Describe `gnus-default-adaptive-score-alist' for adaptive values logic.

;; Summary
(setq gnus-summary-line-format
      "%U%R %-18,18&user-date; %-25,25f %4i %5L   %B%S\n")
(setq gnus-summary-goto-unread nil)
(setq gnus-summary-make-false-root 'adopt)
(setq gnus-summary-thread-gathering-function
      'gnus-gather-threads-by-subject)
(setq gnus-summary-gather-subject-limit 'fuzzy)

;; Thread
(setq gnus-thread-hide-subtree nil)
(setq gnus-thread-ignore-subject nil)
(setq gnus-user-date-format-alist
      '(((gnus-seconds-today) . "Today at %R")
        ((+ (* 60 60 24) (gnus-seconds-today)) . "Yesterday, %R")
        (t . "%Y-%m-%d %R")))
(setq gnus-sum-thread-tree-false-root "")
(setq gnus-sum-thread-tree-indent " ")
(setq gnus-sum-thread-tree-single-indent "")
(setq gnus-sum-thread-tree-leaf-with-other "+-> ")
(setq gnus-sum-thread-tree-root "")
(setq gnus-sum-thread-tree-single-leaf "\\-> ")
(setq gnus-sum-thread-tree-vertical "|")

;; Article
(setq gnus-article-browse-delete-temp 'ask)
(setq gnus-article-over-scroll nil)
(setq gnus-article-show-cursor t)
(setq gnus-article-truncate-lines nil)
(setq gnus-html-frame-width 80)
(setq gnus-html-image-automatic-caching t)
(setq gnus-inhibit-images t)
(setq gnus-max-image-proportion 0.7)
(setq gnus-treat-display-smileys nil)
(setq gnus-visible-headers
      '("^From:" "^To:"	"^[BGF]?Cc:" "^Subject:" "^Newsgroups:" "^Date:"
	"^Followup-To:" "^Reply-To:" "^Organization:" "^Summary:" "^Keywords:"
	"^Posted-To:" "^Mail-Copies-To:" "^Mail-Followup-To:" "^Apparently-To:"
	"^Gnus-Warning:" "^Resent-From:" "^X-Newsreader:" "^X-Mailer:"))
(setq gnus-sorted-header-list gnus-visible-headers)
(setq gnus-article-x-face-too-ugly ".*")

;;* Bindings:

(global-set-key (kbd "C-c g") 'gnus)

;;* Hooks:

(add-hook 'dired-mode-hook 'turn-on-gnus-dired-mode)
(add-hook 'gnus-select-group-hook 'gnus-group-set-timestamp)
(add-hook 'gnus-group-mode-hook 'gnus-topic-mode)
(add-hook 'gnus-summary-exit-hook 'gnus-summary-bubble-group)

(add-hook 'gnus-group-mode-hook 'hl-line-mode)
(add-hook 'gnus-summary-mode-hook 'hl-line-mode)
(add-hook 'gnus-browse-mode-hook 'hl-line-mode)

;;* Appearance:


(provide 'tty-com-gnus)

;;; tty-com-gnus.el ends here
