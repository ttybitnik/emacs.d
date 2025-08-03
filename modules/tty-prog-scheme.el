;;; tty-prog-scheme.el --- Scheme Programming Language -*- lexical-binding: t -*-

;;; Commentary:

;; Scheme-related tunings.

;;; Code:

(require 'scheme)
(require 'cmuscheme)
;; (require-package 'geiser)
;; (require-package 'geiser-guile)
;; (require-package 'geiser-chicken)

;;* Variables:

;;* Functions:

(defun scheme-mode/ttybitnik ()
  "Set up `scheme-mode' hooks."
  (yas-minor-mode)
  (flymake-mode)
  (eldoc-mode)
  (evil-cleverparens-mode))

;; TODO: Overwrite upstream to fix file-name on remote systems (remove if merged)
(defun scheme-load-file (file-name)
  "Load a Scheme file FILE-NAME into the inferior Scheme process."
  (interactive (comint-get-source "Load Scheme file" scheme-prev-l/c-dir/file
				  scheme-source-modes t)) ; t because `load'
                                                          ; needs an exact name
  (comint-check-source file-name) ; Check to see if buffer needs saved.
  (setq scheme-prev-l/c-dir/file (cons (file-name-directory    file-name)
				       (file-name-nondirectory file-name)))
  (comint-send-string (scheme-proc) (concat "(load \""
					    (file-local-name file-name)
					    "\")\n")))

;; TODO: Overwrite upstream to fix file-name on remote systems (remove if merged)
(defun scheme-compile-file (file-name)
  "Compile a Scheme file FILE-NAME in the inferior Scheme process."
  (interactive (comint-get-source "Compile Scheme file"
				  scheme-prev-l/c-dir/file
				  scheme-source-modes
				  nil)) ; nil because COMPILE doesn't
                                        ; need an exact name.
  (comint-check-source file-name) ; Check to see if buffer needs saved.
  (setq scheme-prev-l/c-dir/file (cons (file-name-directory    file-name)
				       (file-name-nondirectory file-name)))
  (comint-send-string (scheme-proc) (concat "(compile-file \""
					    (file-local-name file-name)
					    "\")\n")))


;;* Main:

;; (setq scheme-program-name "guile3.0")
(setq scheme-program-name "csi")

;; (setq geiser-guile-binary "guile3.0")
;; (setq geiser-chicken-binary "csi")

;;* Bindings:

;;* Hooks:

(add-hook 'scheme-mode-hook 'scheme-mode/ttybitnik)

;;* Appearance:


(provide 'tty-prog-scheme)

;;; tty-prog-scheme.el ends here
