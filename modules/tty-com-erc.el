;;; tty-com-erc.el --- Emacs Relay Chat -*- lexical-binding: t -*-

;;; Commentary:

;; ERC-related tunings.

;;; Code:

(require-package 'erc)
(require-package 'erc-hl-nicks)
(require 'erc-services)

;;* Variables:

;;* Functions:

(defun erc-login/ttybitnik ()
  "ERC libera.chat login with SASL."
  (interactive)
  (erc-tls :server "irc.libera.chat" :port "6697"))

(defun erc-switch-buffer/ttybitnik (orig-fun &optional arg)
  "Move to the end of the buffer after `erc-track-switch-buffer'.
ORIG-FUN is the original function that is being advised.
Optional ARG is the argument passed to the original function."
  (funcall orig-fun arg)
  (when (eq major-mode 'erc-mode)
    (goto-char (point-max))))

(defun erc-login ()
  "Perform user authentication at the IRC server (PATCHED)."
  (erc-log (format "login: nick: %s, user: %s %s %s :%s"
                   (erc-current-nick)
                   (user-login-name)
                   (or erc-system-name (system-name))
                   erc-session-server
                   erc-session-user-full-name))
  (if erc-session-password
      (erc-server-send (format "PASS %s" erc-session-password))
    (message "Logging in without password"))
  (when (and (featurep 'erc-sasl) (erc-sasl-use-sasl-p))
    (erc-server-send "CAP REQ :sasl"))
  (erc-server-send (format "NICK %s" (erc-current-nick)))
  (erc-server-send
   (format "USER %s %s %s :%s"
           (if erc-anonymous-login erc-email-userid (user-login-name))
           "0" "*"
           erc-session-user-full-name))
  (erc-update-mode-line))

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
(setq erc-quit-reason (lambda (s) (or s "Fading out...")))
(setq erc-log-channels-directory
      (expand-file-name (file-name-as-directory "logs") orpheusmx-d/ttybitnik))
(setq erc-save-buffer-on-part t)
(setq erc-track-priority-faces-only 'all)
(setq erc-track-faces-priority-list '(erc-error-face
                                      erc-current-nick-face
                                      erc-keyword-face
                                      erc-nick-msg-face
                                      erc-direct-msg-face
                                      erc-dangerous-host-face
                                      erc-notice-face
                                      erc-prompt-face))
(setq erc-modules '(autoaway autojoin button completion fill irccontrols
                             keep-place list match menu move-to-prompt netsplit
                             networks noncommands readonly ring stamp track
                             hl-nicks scrolltobottom log))
(setq erc-lurker-hide-list '("JOIN" "PART" "QUIT"))
(setq erc-track-exclude-types '("JOIN" "PART" "NICK" "MODE" "AWAY" "QUIT"
				"324" "329" "332" "333" "353" "477"))

(load-file (expand-file-name "erc-sasl.el" local-d/ttybitnik))
(require 'erc-sasl)

(advice-add 'erc-track-switch-buffer :around #'erc-switch-buffer/ttybitnik)
(add-to-list 'erc-sasl-server-regexp-list "irc\\.libera\\.chat")

;;* Bindings:

(global-set-key (kbd "C-c i") 'erc-login/ttybitnik)

;;* Hooks:

;;* Appearance:


(provide 'tty-com-erc)

;;; tty-com-erc.el ends here
