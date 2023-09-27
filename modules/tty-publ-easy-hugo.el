;;; tty-publ-easy-hugo.el --- Easy Hugo -*- lexical-binding: t -*-

;;; Commentary:

;; Easy-hugo related tunings.

;;; Code:

(require-package 'easy-hugo)

;;* Variables:

;;* Functions:

;;* Main:

(setq easy-hugo-postdir "content/blog"
      easy-hugo-basedir (concat (getenv "TTY_GITHUB") "/blog.backend")
      easy-hugo-url "https://ttybitnik.github.io"
      easy-hugo-sshdomain ""
      easy-hugo-root (concat (getenv "TTY_GITHUB") "/blog.backend/public"))

(setq easy-hugo-previewtime "300"
      easy-hugo-default-ext ".org"
      easy-hugo-org-header t)

(setq easy-hugo--sort-char-flg nil
      easy-hugo--sort-time-flg nil
      easy-hugo--sort-publishday-flg 1)

;;* Bindings:

(global-set-key (kbd "C-c h") 'easy-hugo)

;;* Hooks:

;;* Appearance:


(provide 'tty-publ-easy-hugo)

;;; tty-publ-easy-hugo.el ends here
