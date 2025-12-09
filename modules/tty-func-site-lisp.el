;;; tty-func-site-lisp.el --- Site Lisp -*- lexical-binding: t -*-

;;; Commentary:

;; Site-lisp related tunings.

;; Sets up load path for locally managed/installed packages in `site-lisp' dir.
;; Used for MELPA/ELPA package overrides, development, forks, and pinning.

;;; Code:

;;* Variables:

;;* Functions:

;;* Main:

(when (file-exists-p site-lisp-d/ttybitnik)
  (dolist (dir (directory-files site-lisp-d/ttybitnik t "^[^.]"))
    (when (file-directory-p dir)
      (add-to-list 'load-path dir nil 'equal))))

;;* Bindings:

;;* Hooks:

;;* Appearance:


(provide 'tty-func-site-lisp)

;;; tty-func-site-lisp.el ends here
