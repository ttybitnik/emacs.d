;;; tty-com-gnus.el --- Gnus Network User Services -*- lexical-binding: t -*-

;;; Commentary:

;; GNUS-related tunings.

;; Useful options currently not being used:
;; (setq gnus-use-cache t)
;; (setq message-citation-line-function nil)
;; (setq message-ignored-cited-headers nil)

;;; Code:

(require-package 'gnus)

;;* Variables:

;;* Functions:

;;* Main:

(setq message-signature "Vinícius Moraes\neternodevir.com")
(setq gnus-select-method
      `(nnimap "gmail"
	       (nnimap-address "imap.gmail.com")
	       (nnimap-server-port 993)
	       (nnimap-stream ssl)))
(setq message-send-mail-function 'smtpmail-send-it)
(setq smtpmail-smtp-server "smtp.gmail.com")
(setq smtpmail-smtp-service 587)
(setq gnus-secondary-select-methods
      '((nntp "news.gmane.io"))) ;; alt (nntp "news.gwene.org")

(setq gnus-ignored-newsgroups
      "^to\\.\\|^[0-9. ]+\\( \\|$\\)\\|^[\"]\"[#'()]")
(setq message-cite-reply-position 'below)
(setq gnus-interactive-exit nil)
(setq gnus-gcc-mark-as-read t)
(setq gnus-agent t)
;; (gnus-novice-user nil)
(setq gnus-check-new-newsgroups 'ask-server)
(setq gnus-read-active-file 'some)
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

(setq gnus-group-sort-function
      '((gnus-group-sort-by-unread)
	(gnus-group-sort-by-alphabet)
	(gnus-group-sort-by-rank)))
(setq gnus-group-line-format "%M%p%P%5y:%B%(%g%)\n")
;; (gnus-group-mode-line-format "%%b")

(setq gnus-auto-select-first nil)
(setq gnus-summary-ignore-duplicates t)
(setq gnus-suppress-duplicates t)
(setq gnus-save-duplicate-list t)
(setq gnus-summary-goto-unread nil)
(setq gnus-summary-make-false-root 'adopt)
(setq gnus-summary-thread-gathering-function
      'gnus-gather-threads-by-subject)
(setq gnus-summary-gather-subject-limit 'fuzzy)
(setq gnus-thread-sort-functions
      '((not gnus-thread-sort-by-date)
	(not gnus-thread-sort-by-number)))
(setq gnus-subthread-sort-functions
      'gnus-thread-sort-by-date)
(setq gnus-thread-hide-subtree nil)
(setq gnus-thread-ignore-subject nil)
(setq gnus-user-date-format-alist
      '(((gnus-seconds-today) . "Today at %R")
	((+ (* 60 60 24) (gnus-seconds-today)) . "Yesterday, %R")
	(t . "%Y-%m-%d %R")))
(setq gnus-summary-line-format
      "%U%R %-18,18&user-date; %-25,25f%4L   %B%S\n")
;; (gnus-summary-mode-line-format "[%U] %p")
(setq gnus-sum-thread-tree-false-root "")
(setq gnus-sum-thread-tree-indent " ")
(setq gnus-sum-thread-tree-single-indent "")
(setq gnus-sum-thread-tree-leaf-with-other "+-> ")
(setq gnus-sum-thread-tree-root "")
(setq gnus-sum-thread-tree-single-leaf "\\-> ")
(setq gnus-sum-thread-tree-vertical "|")

(setq gnus-article-browse-delete-temp 'ask)
(setq gnus-article-over-scroll nil)
(setq gnus-article-show-cursor t)
(setq gnus-article-sort-functions
      '((not gnus-article-sort-by-number)
	(not gnus-article-sort-by-date)))
(setq gnus-article-truncate-lines nil)
(setq gnus-html-frame-width 80)
(setq gnus-html-image-automatic-caching t)
(setq gnus-inhibit-images t)
(setq gnus-max-image-proportion 0.7)
(setq gnus-treat-display-smileys nil)
;; (gnus-article-mode-line-format "%G %S %m")
(setq gnus-visible-headers
      '("^From:" "^To:" "^Cc:" "^Subject:" "^Newsgroups:" "^Date:"
	"Followup-To:" "Reply-To:" "^Organization:" "^X-Newsreader:"
	"^X-Mailer:"))
(setq gnus-sorted-header-list gnus-visible-headers)
(setq gnus-article-x-face-too-ugly ".*")

(setq mm-verify-option 'always)
(setq mm-decrypt-option 'always)
(setq mm-sign-option 'guided)

;;* Bindings:

(global-set-key (kbd "C-c g") 'gnus)

;;* Hooks:

(add-hook 'dired-mode-hook 'turn-on-gnus-dired-mode)
(add-hook 'gnus-group-mode-hook 'gnus-topic-mode)
(add-hook 'gnus-select-group-hook 'gnus-group-set-timestamp)
(add-hook 'gnus-group-mode-hook 'hl-line-mode)
(add-hook 'gnus-summary-mode-hook 'hl-line-mode)
(add-hook 'gnus-browse-mode-hook 'hl-line-mode)

;;* Appearance:


(provide 'tty-com-gnus)

;;; tty-com-gnus.el ends here
