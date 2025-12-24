;;; tty-misc-calibre.el --- Calibre -*- lexical-binding: t -*-

;;; Commentary:

;; Calibre-related tunings.

;;; Code:
(require-package 'calibredb)
(require 'org-ref)

;;* Variables:

(defconst calibre-root-dir/ttybitnik
  (expand-file-name "Library/Calibre" prometheus-d/ttybitnik)
  "Absolute name of Calibre directory inside Prometheus.")

;;* Functions:

;;* Main:

;; DEPRECATED 2025-12-23: `calibre' ELPA package interface is a bit more rough.
;; (require-package 'calibre)
;; (setq calibre-libraries
;;       `(("Main" .
;;          ,(expand-file-name "Library/Calibre" prometheus-d/ttybitnik))))
;; (setq calibre-virtual-libraries
;;       '(("Físicos" .
;;          [[+ format "TXT"]])
;;         ("Digitais" .
;;          [[- format "TXT"]])))


(setq calibredb-root-dir calibre-root-dir/ttybitnik)
(setq calibredb-db-dir (expand-file-name "metadata.db" calibredb-root-dir))
(setq calibredb-library-alist
      `((,calibre-root-dir/ttybitnik (name . "Calibre"))))

(setq calibredb-virtual-library-alist
      '(("0. Todos" . "")
        ("1. Físicos" . "TXT")
        ;; TODO: Perhaps a PR for a NOT operator. Here should be "!TXT"
        ("2. Digitais" . "EPUB PDF")
        ;; TODO: There is no support for custom columns. `calibredb.el' is tag
        ;; based as it seems.
        ("3. Revistas" . "Online")))

(setq calibredb-search-page-max-rows 50)

(setq calibredb-id-width 5)
(setq calibredb-comment-width 0)

;; TODO: Review `org-ref' before testing this.
;; (setq calibredb-ref-default-bibliography
;;       (expand-file-name "catalog.bib" calibredb-root-dir))
;; (add-to-list 'org-ref-default-bibliography calibredb-ref-default-bibliography)
;; (setq org-ref-get-pdf-filename-function 'org-ref-get-mendeley-filename)

;;* Bindings:

(global-set-key (kbd "C-c b") 'calibredb)
(global-set-key (kbd "C-c s b") 'calibredb-consult-read)

(define-key calibredb-search-mode-map (kbd "C-j") 'calibredb-search-next-page)
(define-key calibredb-search-mode-map (kbd "C-k") 'calibredb-search-previous-page)
;; Unset 'remove an entry' for safety.
(keymap-unset calibredb-search-mode-map "d")

;;* Hooks:

;;* Appearance:


(provide 'tty-misc-calibre)

;;; tty-misc-calibre.el ends here
