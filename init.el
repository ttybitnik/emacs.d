(require 'package)
(setq package-enable-at-startup nil)

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)

(setq package-archive-priorities '(("gnu" . 4)
				   ("nongnu" . 3)
				   ("melpa-stable" . 2)
				   ("melpa" . 1)))

(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(when (file-readable-p "~/.emacs.d/odysseus.org")
  (org-babel-load-file (expand-file-name "~/.emacs.d/odysseus.org")))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auth-source-save-behavior nil)
 '(column-number-mode t)
 '(custom-safe-themes '(default))
 '(display-time-24hr-format t)
 '(line-number-mode t)
 '(package-selected-packages
   '(centered-cursor-mode dired-subtree all-the-icons-dired wgrep multiple-cursors nov exec-path-from-shell graphviz-dot-mode plantuml-mode org-roam-bibtex undo-tree consult-lsp rust-mode ansible lsp-json js2-mode lsp-pyright lsp-treemacs helm-lsp lsp-ui lsp-mode consult evil json-mode gruvbox-theme org fountain-mode toc-org olivetti orgmdb pdf-tools org-noter org-bibtex org-ref helm-bibtex company-elisp helm-elisp company-sly sly helm-descbinds easy-hugo org-auto-tangle go-mode go-translate markdown-mode yaml-mode ox-reveal diminish erc-hl-nicks ox-twbs org-bullets htmlize sudo-edit magit love-minor-mode auto-complete company-shell company-jedi company-irony company-c-headers flycheck-clang-analyzer company flycheck yasnippet-snippets yasnippet popup-kill-ring zzz-to-char hungry-delete expand-region rainbow-delimiters beacon mark-multiple compat all-the-icons rainbow-mode))
 '(pos-tip-background-color "#36473A")
 '(pos-tip-foreground-color "#FFFFC8")
 '(powerline-default-separator 'arrow)
 '(send-mail-function 'smtpmail-send-it)
 '(spaceline-buffer-encoding-abbrev-p nil t)
 '(spaceline-line-column-p nil t)
 '(spaceline-line-p nil t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :width normal :family "Iosevka Medium" :height 102))))
 '(dashboard-heading ((t (:inherit font-lock-keyword-face :height 1.1))))
 '(fixed-pitch ((t (:family "Iosevka  Medium"))))
 '(fringe ((t (:background "burlywood4"))))
 '(org-block ((t (:inherit fixed-pitch))))
 '(org-code ((t (:inherit (shadow fixed-pitch)))))
 '(org-indent ((t (:inherit (org-hide fixed-pitch)))))
 '(org-level-1 ((t (:height 1.5))))
 '(org-level-2 ((t (:height 1.4))))
 '(org-level-3 ((t (:height 1.3))))
 '(org-level-4 ((t (:height 1.2))))
 '(org-level-5 ((t (:height 1.1))))
 '(org-level-6 ((t (:height 1.1))))
 '(org-level-7 ((t (:height 1.1))))
 '(org-level-8 ((t (:height 1.1))))
 '(org-table ((t (:inherit fixed-pitch))))
 '(variable-pitch ((t (:family "Iosevka Aile")))))
