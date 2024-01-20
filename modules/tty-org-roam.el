;;; tty-org-roam.el --- Org-mode Roam Research -*- lexical-binding: t -*-

;;; Commentary:

;; Org-roam related tunings.

;;; Code:

(require-package 'org-roam)
(require-package 'org-roam-bibtex)
(require-package 'org-roam-ui)

;;* Variables:

(defconst roam-d/ttybitnik
  (concat orpheusmx-d/ttybitnik (file-name-as-directory "org-roam"))
  "Absolute path of org-roam directory inside Orpheus.")

;;* Functions:

(defun roam-capture-helper (template)
  "Expand TEMPLATE filename for `org-roam-capture-templates'.
It returns the absolute path from local templates in
`local-d/ttybitnik' org-roam directory."
  (expand-file-name
   template (concat local-d/ttybitnik (file-name-as-directory "org-roam"))))

;;* Main:

(setq org-roam-directory (file-truename roam-d/ttybitnik))
(setq org-roam-mode-sections (list #'org-roam-backlinks-section
				   #'org-roam-reflinks-section
				   #'org-roam-unlinked-references-section))

(setq org-roam-capture-templates
      `(("p" "Project")
	("pw" "Writing" plain
	 (file ,(roam-capture-helper "writing-template.org"))
	 :target (file "%<%Y%m%d%H%M%S>-writing-${slug}.org")
	 :unnarrowed t :clock-in t :clock-resume t
	 :jump-to-captured t :kill-buffer nil)

	("pp" "Presenting" plain
	 (file ,(roam-capture-helper "presenting-template.org"))
	 :target (file "%<%Y%m%d%H%M%S>-presenting-${slug}.org")
	 :unnarrowed t :clock-in t :clock-resume t
	 :jump-to-captured t :kill-buffer nil)

	("pb" "Blogging" plain
	 (file ,(roam-capture-helper "blogging-template.org"))
	 :target (file "%<%Y%m%d%H%M%S>-blogging-${slug}.org")
	 :unnarrowed t :clock-in t :clock-resume t
	 :jump-to-captured t :kill-buffer nil)

	("ps" "Sprint" plain
	 (file ,(roam-capture-helper "sprint-template.org"))
	 :target (file "%<%Y%m%d%H%M%S>-sprint-${slug}.org")
	 :unnarrowed t :clock-in t :clock-resume t)

	("c" "Capture")
	("cb" "Book" plain
	 (file ,(roam-capture-helper "book-template.org"))
	 :target (file "ref/${citekey}.org")
	 :unnarrowed t :clock-in t :clock-resume t)

	("cm" "Movie" plain
	 (file ,(roam-capture-helper "movie-template.org"))
	 :target (file "%<%Y%m%d%H%M%S>-movie-${slug}.org")
	 :unnarrowed t :clock-in t :clock-resume t)

	("cu" "Music" plain
	 (file ,(roam-capture-helper "music-template.org"))
	 :target (file "%<%Y%m%d%H%M%S>-music-${slug}.org")
	 :unnarrowed t :clock-in t :clock-resume t)

	("co" "Podcast" plain
	 (file ,(roam-capture-helper "podcast-template.org"))
	 :target (file "%<%Y%m%d%H%M%S>-podcast-${slug}.org")
	 :unnarrowed t :clock-in t :clock-resume t)

	("cp" "Poem" plain
	 (file ,(roam-capture-helper "poem-template.org"))
	 :target (file "%<%Y%m%d%H%M%S>-poem-${slug}.org")
	 :unnarrowed t :clock-in t :clock-resume t)

	("cq" "Quote" plain
	 (file ,(roam-capture-helper "quote-template.org"))
	 :target (file "%<%Y%m%d%H%M%S>-quote-${slug}.org")
	 :unnarrowed t :clock-in t :clock-resume t)

	("ct" "Text" plain
	 (file ,(roam-capture-helper "text-template.org"))
	 :target (file "%<%Y%m%d%H%M%S>-text-${slug}.org")
	 :unnarrowed t :clock-in t :clock-resume t)

	("ch" "Theatre" plain
	 (file ,(roam-capture-helper "theatre-template.org"))
	 :target (file "%<%Y%m%d%H%M%S>-theatre-${slug}.org")
	 :unnarrowed t :clock-in t :clock-resume t)

	("n" "Note")
	("nc" "Class" plain
	 (file ,(roam-capture-helper "class-template.org"))
	 :target (file "%<%Y%m%d%H%M%S>-class-${slug}.org")
	 :unnarrowed t :clock-in t :clock-resume t)

	("no" "Convo" plain
	 (file ,(roam-capture-helper "convo-template.org"))
	 :target (fiLe "%<%Y%m%d%H%M%S>-convo-${slug}.org")
	 :unnarrowed t :clock-in t :clock-resume t)

	("nu" "Course" plain
	 (file ,(roam-capture-helper "course-template.org"))
	 :target (file "%<%Y%m%d%H%M%S>-course-${slug}.org")
	 :unnarrowed t :clock-in t :clock-resume t)

	("ni" "Idea" plain
	 (file ,(roam-capture-helper "idea-template.org"))
	 :target (file "%<%Y%m%d%H%M%S>-idea-${slug}.org")
	 :unnarrowed t :clock-in t :clock-resume t)

	("nz" "Zettel" plain
	 (file ,(roam-capture-helper "zettel-template.org"))
	 :target (file "%<%Y%m%d%H%M%S>-zettel-${slug}.org")
	 :unnarrowed t :clock-in t :clock-resume t)

	("i" "Index" plain
	 (file ,(roam-capture-helper "index-template.org"))
	 :target (file "%<%Y%m%d%H%M%S>-index-${slug}.org")
	 :unnarrowed t :clock-in t :clock-resume t)

	("h" "Placeholder" plain
	 (file ,(roam-capture-helper "placeholder-template.org"))
	 :target (file "%<%Y%m%d%H%M%S>-index-${slug}.org")
	 :unnarrowed t :clock-in t :clock-resume t)))

;; (setq orb-insert-interface 'helm-bibtex)
(setq orb-autokey-format "%A%y")
;; (setq orb-preformat-keywords
;;       '("citekey" "title" "url" "author-or-editor" "keywords" "file"))
(setq orb-process-file-keyword t)
(setq orb-attached-file-extensions '("pdf" "epub" "mobi"))

(setq org-roam-ui-sync-theme t)
(setq org-roam-ui-follow t)
(setq org-roam-ui-update-on-save t)
(setq org-roam-ui-open-on-start t)

(org-roam-db-autosync-mode 1)

(org-roam-bibtex-mode 1)

(setq org-roam-database-connector 'sqlite)

;;* Bindings:

(global-set-key (kbd "C-c n f") 'org-roam-node-find)
(global-set-key (kbd "C-c n i") 'org-roam-node-insert)
(global-set-key (kbd "C-c n r") 'org-roam-ref-add)
(global-set-key (kbd "C-c n t") 'org-roam-tag-add)
(global-set-key (kbd "C-c n c") 'org-roam-capture)
(global-set-key (kbd "C-c n n") 'org-roam-buffer-toggle)
(global-set-key (kbd "C-c n a") 'org-roam-alias-add)
(global-set-key (kbd "C-c n s") 'org-roam-db-sync)
(global-set-key (kbd "C-c n u") 'org-roam-ui-mode)
(global-set-key (kbd "C-c n y") 'org-roam-ui-sync-theme)

;;* Hooks:

(add-hook 'kill-emacs-hook 'org-roam-db-sync)

;;* Appearance:

(add-to-list 'display-buffer-alist
	     '("\\*org-roam\\*"
	       (display-buffer-in-direction)
	       (direction . right)
	       (window-width . 0.33)
	       (window-height . fit-window-to-buffer)))

(diminish 'org-roam-bibtex-mode)
(diminish 'org-roam-ui-follow-mode)

(provide 'tty-org-roam)

;;; tty-org-roam.el ends here
