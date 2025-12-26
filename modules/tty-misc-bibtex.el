;;; tty-misc-bibtex.el --- Bibliographic TeX -*- lexical-binding: t -*-

;;; Commentary:

;; Bibtex-related tunings.

;; Settings from documentation not being used:
;; (setq bibtex-align-at-equal-sign t)
;; (setq bibtex-autokey-name-year-separator "")
;; (setq bibtex-autokey-year-title-separator "")
;; (setq bibtex-autokey-year-length 4)
;; (setq bibtex-autokey-titleword-first-ignore '("the" "a" "if" "and" "an"))
;; (setq bibtex-autokey-titleword-length 20)
;; (setq bibtex-autokey-titlewords-stretch 0)
;; (setq bibtex-autokey-titlewords 0)
;; (setq bibtex-completion-notes-template-multiple-files "#+TITLE:
;;  ${=key=}\n#+CREATED: %U\n#+LAST_MODIFIED: %U\n\nLiterature notes for
;;  cite:${=key=}.\n\n")

;;; Code:

(require-package 'bibtex)
(require-package 'bibtex-completion)

;;* Variables:

;;* Functions:

;;* Main:
;; TODO: Update values to new Calibre database keys.

(setq bibtex-completion-bibliography
      `(,(expand-file-name "Library/general.bib" prometheus-d/ttybitnik)))
(setq bibtex-completion-library-path
      `(,(expand-file-name (file-name-as-directory "Library/Calibre")
			               prometheus-d/ttybitnik)))
(setq bibtex-completion-notes-path
      (expand-file-name (file-name-as-directory "org-roam/ref")))

(setq bibtex-dialect 'biblatex)
(setq bibtex-completion-pdf-extension '(".pdf" ".epub" ".mobi"))
(setq bibtex-completion-pdf-field "file")
(setq bibtex-completion-pdf-symbol "P")
(setq bibtex-completion-notes-symbol "N")
(setq bibtex-completion-cite-default-command "cite")
;; (setq bibtex-completion-pdf-open-function 'helm-open-file-with-default-tool)
;; (setq bibtex-completion-additional-search-fields
;;       '(tags custom_materia custom_yesno custom_organizer
;; 	         custom_fichamento languages))

(setq bibtex-completion-format-citation-functions
      '((org-mode . bibtex-completion-format-citation-org-cite)  ;; not sure about this
        (latex-mode . bibtex-completion-format-citation-cite)
        (LaTeX-mode . bibtex-completion-format-citation-cite)
        (markdown-mode . bibtex-completion-format-citation-pandoc-citeproc)
        (python-mode . bibtex-completion-format-citation-sphinxcontrib-bibtex)
        (rst-mode . bibtex-completion-format-citation-sphinxcontrib-bibtex)
        (default . bibtex-completion-format-citation-default)))

;; (setq bibtex-completion-display-formats
;;       '((t . "${=has-pdf=:1}${=has-note=:1} ${year:4} ${author:25} ${title:*}
;; ${tags:25} ${languages:6} ${custom_yesno:1} ${custom_fichamento:9}
;; ${custom_organizer:10} ${custom_materia:25}")))
;; (setq bibtex-user-optional-fields
;;       '(("languages" "Languages")
;; 	    ("custom_fichamento" "Note-taking status")
;; 	    ("custom_organizer" "File type")
;; 	    ("custom_yesno" "Reading status")
;; 	    ("custom_materia" "Custom category")
;; 	    ("tags" "Personal tags")
;; 	    ("file" "File name")))


(bibtex-completion-init)

;;* Bindings:

;;* Hooks:

;;* Appearance:


(provide 'tty-misc-bibtex)

;;; tty-misc-bibtex.el ends here
