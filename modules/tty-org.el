;;; tty-org.el --- Org-mode Module -*- lexical-binding: t -*-

;;; Commentary:

;; This module tailors settings and packages for org-mode in Emacs.

;;; Code:

(require 'org)
(require 'tty-org-auto-tangle)
(require 'tty-org-bullets)
(require 'tty-org-noter)
(require 'tty-org-orgmdb)
(require 'tty-org-ref)
(require 'tty-org-roam)
(require 'tty-org-toc-org)

;;* Variables:

(defconst agenda-d/ttybitnik
  (concat roam-d/ttybitnik (file-name-as-directory "agenda"))
  "Absolute path of org-agenda directory inside Orpheus.")

;;* Functions:

(defun org-capture-helper (template)
  "Expand TEMPLATE filename for `org-capture-templates'.
It returns the absolute path from local templates in
`local-d/ttybitnik' org directory."
  (expand-file-name
   template (concat local-d/ttybitnik (file-name-as-directory "org"))))

(defun agenda-capture-helper (agenda-file)
  "Expand AGENDA-FILE filename for `org-capture-templates'.
It returns the absolute path from an `org-agenda' file in
`agenda-d/ttybitnik'."
  (expand-file-name agenda-file agenda-d/ttybitnik))

;;* Main:

(setq org-ellipsis " ")
(setq org-use-speed-commands t)
(setq org-src-fontify-natively t)
(setq org-src-tab-acts-natively t)
(setq org-confirm-babel-evaluate t)
(setq org-export-with-smart-quotes t)
(setq org-src-window-setup 'current-window)
(setq org-agenda-start-with-log-mode t)
(setq org-log-done 'time)
(setq org-log-into-drawer t)
(setq org-agenda-files `(,(concat agenda-d/ttybitnik)))
(setq org-babel-python-command "python3")
(setq org-refile-targets '((nil :maxlevel . 1)
			   (org-agenda-files :maxlevel . 1)))
(setq org-tag-alist '((:startgroup)
                      ("personal" . ?p)
                      ("work" . ?w)
                      ("study" . ?s)
                      (:endgroup)
                      ("autobiography" . ?a)
                      ("cinema" . ?c)
                      ("computing" . ?u)
                      ("reading" . ?r)
                      ("translation" . ?t)
                      ("music" . ?m)))

(setq org-capture-templates
      `(("t" "Task" entry
	 (file+headline
	  ,(agenda-capture-helper "refile.org") "Tasks")
	 (file ,(org-capture-helper "task-template.org"))
	 :clock-in t :clock-resume t)

	("m" "Meeting" entry
	 (file+headline
 	  ,(agenda-capture-helper "refile.org") "Meetings")
	 (file ,(org-capture-helper "meeting-template.org"))
	 :clock-in t :clock-resume t)

	("n" "Notes" entry
	 (file+headline
 	 ,(agenda-capture-helper "refile.org") "Notes")
	 (file ,(org-capture-helper "note-template.org"))
	 :clock-in t :clock-resume t)

	("j" "Journal" entry
	 (file+olp+datetree ,(agenda-capture-helper "journal.org"))
	 (file ,(org-capture-helper "journal-template.org"))
	 :clock-in t :clock-resume t)))

(setq org-todo-keywords
      '((sequence "TODO(t!)" "NEXT(n!)" "WAIT(h@/!)" "|" "MEET(m!)"
		  "DONE(d!)" "CANCELED(c@/!)")
	(sequence "DRAFT(a!)" "WRITING(w!)" "REVISION I(r!)" "REVISION II(e!)"
		  "PROOFREADING(o!)" "|" "PUBLISHED(p!)")))

(org-babel-do-load-languages 'org-babel-load-languages
			     '((emacs-lisp . t)
			       (shell . t)
			       (python . t)
			       (C . t)
			       (plantuml . t)))

(add-to-list 'org-modules 'org-timer)
(setq org-timer-default-timer 50)

;;* Bindings:

(global-set-key (kbd "C-c '") 'org-edit-src-code)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c c") 'org-capture)

;;* Hooks:

(add-hook 'org-mode-hook (lambda ()
			   (visual-line-mode)
			   (variable-pitch-mode)
			   (org-indent-mode)
			   (company-mode)
			   (yas-minor-mode)))

(add-hook 'org-clock-in-hook (lambda ()
			       (unless org-timer-countdown-timer
				 (org-timer-set-timer org-timer-default-timer))))
;;* Appearance:


(provide 'tty-org)

;;; tty-org.el ends here
