;;; tty-misc-citar.el --- Citar -*- lexical-binding: t -*-

;;; Commentary:

;; Citar-related tunings.

;; `citar-org-roam' required in `tty-org'.

;; Docs for `org-cite', which `citar' uses for Org:
;;  <https://orgmode.org/manual/Citations.html>

;; `citar' vs `org-ref':
;;  <https://github.com/emacs-citar/citar/wiki/Comparisons>
;;  <https://github.com/jkitchin/org-ref?tab=readme-ov-file#what-about-org-cite>

;; File association between Zotero and Calibre:
;;  <https://github.com/emacs-citar/citar/wiki/Zotero-integration#linking-from-citar-to-zotero>
;;  <https://github.com/emacs-citar/citar#files-file-association-and-file-field-parsing>

;;; Code:
(require-package 'citar)
(require-package 'citar-embark)
(require-package 'citar-org-roam)

;;* Variables:

(defconst general-bibliography/ttybitnik
  (expand-file-name "Library/general.bib" prometheus-d/ttybitnik)
  "Absolute name of general bibliography file inside Prometheus.")

;;* Functions:

;;* Main:

(citar-embark-mode)

(setq citar-org-roam-subdir "ref/")
(setq org-cite-global-bibliography `(,general-bibliography/ttybitnik))
(setq citar-bibliography org-cite-global-bibliography)
(setq org-cite-insert-processor 'citar)
(setq org-cite-follow-processor 'citar)
(setq org-cite-activate-processor 'citar)

;; If you prefer to have the Embark menu open with org-open-at-point, you should
;; set this variable.
(setq citar-at-point-function 'embark-act)

;; FIXME: This should trigger `org-roam-capture' instead of a hard-coded key.
;; (setq citar-org-roam-capture-template-key "cb") Partial integration with

;; `org-roam-bibtex'. Solve the FIXME above, although seems to reset every
;; usage. Need to investigate the root cause.
(citar-register-notes-source
 'orb-citar-source (list :name "Org-Roam Notes"
                         :category 'org-roam-node
                         :items #'citar-org-roam--get-candidates
                         :hasitems #'citar-org-roam-has-notes
                         :open #'citar-org-roam-open-note
                         :create #'orb-citar-edit-note
                         :annotate #'citar-org-roam--annotate))
;; (setq citar-open-note-function 'orb-citar-edit-note)
(setq citar-notes-source 'orb-citar-source)

;; Default templates variable, no modifications for now.
;; (setq citar-templates ...)

;; TODO: Configure indicators. I think the below is not what I want.
;; (setq citar-indicators
;;       (list citar-indicator-files
;;             citar-indicator-notes-icons))

;; TODO: Try out search presets functionality.
;; (setq citar-presets '("one search string" "another search string"))

;; Parse Zotero and Calibre files. Seems like this is default now.
;; (setq citar-file-parser-functions
;;       '(citar-file-parser-default
;;         citar-file-parser-triplet))

;; TODO: Define which file extensions open commands will recognize.
;; (setq citar-library-file-extensions (list "pdf" "jpg")
;;       citar-file-additional-files-separator "-")

;; In case it is necessary to change the default title template.
;; (setq citar-org-roam-note-title-template "${author} - ${title}")


;;* Bindings:

(define-key citar-embark-map (kbd "z") #'citar-open-entry-in-zotero)

(global-set-key (kbd "C-c b f") 'citar-open-notes)

;;* Hooks:

(add-hook 'tex-mode-hook 'citar-capf-setup)
(add-hook 'org-mode-hook 'citar-capf-setup)
(add-hook 'org-mode-hook 'citar-org-roam-mode)

;;* Appearance:


(provide 'tty-misc-citar)

;;; tty-misc-citar.el ends here
