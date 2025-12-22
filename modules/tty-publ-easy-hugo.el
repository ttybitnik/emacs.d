;;; tty-publ-easy-hugo.el --- Easy Hugo -*- lexical-binding: t -*-

;;; Commentary:

;; Easy-hugo related tunings.

;;; Code:

(require-package 'easy-hugo)

;;* Variables:

;;* Functions:

;;* Main:

(setq easy-hugo-postdir "content/palimpsests"
      easy-hugo-basedir (file-name-as-directory
			             (concat git-d/ttybitnik "blog.backend"))
      easy-hugo-url "https://eternodevir.com"
      easy-hugo-sshdomain ""
      easy-hugo-root (file-name-as-directory
		              (concat git-d/ttybitnik "blog.backend/public")))

(setq easy-hugo-previewtime "300"
      easy-hugo-default-ext ".org")

(setq easy-hugo--sort-char-flg nil
      easy-hugo--sort-time-flg nil
      easy-hugo--sort-publishday-flg 1)

(setq easy-hugo-github-deploy-display-buffer t)

;;* Bindings:

(global-set-key (kbd "C-c h") 'easy-hugo)

;;* Hooks:

;;* Appearance:


(provide 'tty-publ-easy-hugo)

;;; tty-publ-easy-hugo.el ends here
