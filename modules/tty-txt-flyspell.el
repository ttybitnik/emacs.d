;;; tty-txt-flyspell.el --- Flyspell Checker -*- lexical-binding: t -*-

;;; Commentary:

;; Flyspell-related tunings.

;;; Code:

(require-package 'flyspell)

;;* Variables:

;;* Functions:

;;* Main:

(setq ispell-program-name "hunspell")
(setq ispell-dictionary  "en_US,en_GB,pt_BR,de_DE,fr_FR")
(setq ispell-personal-dictionary "~/.hunspell_personal")
(setq flyspell-issue-message-flag nil)

(setenv "LANG" "en_US.UTF-8")
(ispell-set-spellchecker-params)
(ispell-hunspell-add-multi-dic "en_US,en_GB,pt_BR,de_DE,fr_FR")

(unless (file-exists-p ispell-personal-dictionary)
  (write-region "" nil ispell-personal-dictionary nil 0))

;;* Bindings:

(define-key global-map (kbd "C-{") 'flyspell-auto-correct-word)
(define-key global-map (kbd "C-}") 'flyspell-goto-next-error)

;;* Hooks:

(add-hook 'text-mode-hook 'flyspell-mode)
(add-hook 'prog-mode-hook 'flyspell-prog-mode)

;;* Appearance:

(diminish 'flyspell-mode)


(provide 'tty-txt-flyspell)

;;; tty-txt-flyspell.el ends here
