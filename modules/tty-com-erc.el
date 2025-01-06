;;; tty-com-erc.el --- Emacs Relay Chat -*- lexical-binding: t -*-

;;; Commentary:

;; ERC-related tunings.

;;; Code:

(require-package 'erc)
(require 'erc-services)

;;* Variables:

(defvar erc-suppress-list/ttybitnik
  "List of channels for suppressing common messages track.")

;;* Functions:

(defun erc-login/ttybitnik ()
  "ERC libera.chat TLS login."
  (interactive)
  (erc-tls :server "irc.libera.chat" :port "6697"
	   :user erc-nick :nick erc-nick))

(defun erc-switch-buffer/ttybitnik (orig-fun &optional arg)
  "Move to the end of the buffer after `erc-track-switch-buffer'.
ORIG-FUN is the original function that is being advised.
Optional ARG is the argument passed to the original function."
  (funcall orig-fun arg)
  (when (eq major-mode 'erc-mode)
    (goto-char (point-max))))

(defun erc-minimal-distraction/ttybitnik ()
  "Toggle mode line display of common ERC activity.
When enabled, only priority faces will be displayed in the mode line track,
filtering out less important messages.  When disabled, all faces and messages
will be displayed."
  (interactive)
  (if (eq erc-track-priority-faces-only nil)
      (setq erc-track-priority-faces-only erc-suppress-list/ttybitnik)
    (setq erc-track-priority-faces-only nil))
  (message "ERC minimal distraction is now %s"
           (if erc-track-priority-faces-only "enabled" "disabled")))

(defun erc-suppress-generate/ttybitnik()
 "Generate a list for `erc-track-priority-faces-only'.
This function filters the ERC channels obtained from
`erc-autojoin-channels-alist' and excludes channels listed in
`erc-priority-list/ttybitnik'.  The resulting list represents
channels that will have common messages suppressed in the mode line'."
  (seq-remove (lambda (item)
                (member item erc-priority-list/ttybitnik))
	      (apply #'append erc-autojoin-channels-alist)))

;;* Main:

(setq erc-server "irc.libera.chat")
(setq erc-auto-query 'bury)
(setq erc-join-buffer 'bury)
(setq erc-kill-buffer-on-part t)
(setq erc-kill-queries-on-quit t)
(setq erc-kill-server-buffer-on-quit t)
(setq erc-interpret-mirc-color t)
(setq erc-rename-buffers t)
(setq erc-track-enable-keybindings t)
(setq erc-track-visibility nil)
(setq erc-track-shorten-start 1)
(setq erc-fill-column 100)
(setq erc-fill-function 'erc-fill-static)
(setq erc-fill-static-center 15)
(setq erc-autoaway-idle-seconds 3600)
(setq erc-quit-reason (lambda (s) (or s "Fading out...")))
(setq erc-log-channels-directory
      (expand-file-name (file-name-as-directory "logs") orpheusmx-d/ttybitnik))
(setq erc-save-buffer-on-part t)
(setq erc-current-nick-highlight-type 'message)
(setq erc-suppress-list/ttybitnik (erc-suppress-generate/ttybitnik))
(setq erc-track-priority-faces-only erc-suppress-list/ttybitnik)
(setq erc-track-faces-priority-list '(erc-error-face
                                      erc-current-nick-face
                                      erc-keyword-face
                                      erc-nick-msg-face
                                      erc-direct-msg-face
                                      erc-dangerous-host-face
                                      erc-notice-face
                                      erc-prompt-face))
(setq erc-modules
      '(autoaway autojoin button completion fill irccontrols keep-place list
		 log match menu netsplit networks noncommands notifications
		 readonly ring sasl scrolltobottom services stamp track))
(setq erc-lurker-hide-list '("JOIN" "PART" "QUIT"))
(setq erc-track-exclude-types '("JOIN" "PART" "NICK" "MODE" "AWAY" "QUIT"
				"324" "329" "332" "333" "353" "477"))

(erc-spelling-mode 1)

(advice-add 'erc-track-switch-buffer :around #'erc-switch-buffer/ttybitnik)

;;* Bindings:

(global-set-key (kbd "C-c i i") 'erc-login/ttybitnik)
(global-set-key (kbd "C-c i d") 'erc-minimal-distraction/ttybitnik)

;;* Hooks:

;;* Appearance:


(provide 'tty-com-erc)

;;; tty-com-erc.el ends here
