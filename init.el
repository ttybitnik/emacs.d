;; This is all kinds of necessary
(require 'package)
(setq package-enable-at-startup nil)

;;; remove SC if you are not using sunrise commander and org if you like outdated packages
(setq package-archives '(("ELPA"  . "http://tromey.com/elpa/")
			 ("gnu"   . "http://elpa.gnu.org/packages/")
			 ("melpa" . "https://melpa.org/packages/")
			 ("org"   . "https://orgmode.org/elpa/")))
(package-initialize)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; Bootstrapping use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;;; This is the actual config file. It is omitted if it doesn't exist so emacs won't refuse to launch.
(when (file-readable-p "~/.emacs.d/odysseus.org")
  (org-babel-load-file (expand-file-name "~/.emacs.d/odysseus.org")))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; Anything below is personal preference.
;;; I recommend changing these values with the "customize" menu
;;; You can change the font to suit your liking, it won't break anything.
;;; The one currently set up is called Terminus.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#0a0814" "#f2241f" "#67b11d" "#b1951d" "#4f97d7" "#a31db1" "#28def0" "#b2b2b2"])
 '(auth-source-save-behavior nil)
 '(column-number-mode t)
 '(custom-safe-themes '(default))
 '(display-time-24hr-format t)
 '(display-time-format "%H:%M - %d %B %Y")
 '(line-number-mode t)
 '(org-agenda-files
   '("/home/wolper/.orpheus/org/sysadmin.org" "/home/wolper/.orpheus/org/darkstar.org" "/home/wolper/.orpheus/org/emacs.org"))
 '(package-selected-packages
   '(company-elisp helm-elisp company-sly sly helm-descbinds easy-hugo org-auto-tangle go-mode go-translate markdown-mode yaml-mode ox-reveal diminish erc-hl-nicks ox-twbs org-bullets htmlize sudo-edit magit love-minor-mode auto-complete company-shell company-jedi company-irony company-c-headers flycheck-clang-analyzer company flycheck yasnippet-snippets yasnippet popup-kill-ring zzz-to-char hungry-delete expand-region rainbow-delimiters beacon mark-multiple compat all-the-icons fountain-mode org-roam-ui org-roam rainbow-mode))
 '(pos-tip-background-color "#36473A")
 '(pos-tip-foreground-color "#FFFFC8")
 '(powerline-default-separator 'arrow)
 '(spaceline-buffer-encoding-abbrev-p nil t)
 '(spaceline-line-column-p nil t)
 '(spaceline-line-p nil t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :width normal :family "Iosevka Medium"))))
 '(fixed-pitch ((t (:family "Iosevka  Medium"))))
 '(fringe ((t (:background "#292b2e"))))
 '(org-block ((t (:inherit fixed-pitch))))
 '(org-code ((t (:inherit (shadow fixed-pitch)))))
 '(org-indent ((t (:inherit (org-hide fixed-pitch)))))
 '(org-table ((t (:inherit fixed-pitch))))
 '(variable-pitch ((t (:family "Iosevka Aile")))))
