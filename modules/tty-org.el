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

(defun clock-in-to-next/bh (kw)
  "Switch a task KW from TODO to NEXT when clocking in.
Skips capture tasks, projects, and subprojects.
Switch projects and subprojects from NEXT back to TODO"
  (when (not (and (boundp 'org-capture-mode) org-capture-mode))
    (cond
     ((and (member (org-get-todo-state) (list "TODO"))
           (is-task-p/bh))
      "NEXT")
     ((and (member (org-get-todo-state) (list "NEXT"))
           (is-project-p/bh))
      "TODO"))))

(defun is-task-p/bh ()
  "Any task with a todo keyword and no subtask."
  (save-restriction
    (widen)
    (let ((has-subtask)
          (subtree-end (save-excursion (org-end-of-subtree t)))
          (is-a-task (member (nth 2 (org-heading-components)) org-todo-keywords-1)))
      (save-excursion
        (forward-line 1)
        (while (and (not has-subtask)
                    (< (point) subtree-end)
                    (re-search-forward "^\*+ " subtree-end t))
          (when (member (org-get-todo-state) org-todo-keywords-1)
            (setq has-subtask t))))
      (and is-a-task (not has-subtask)))))

(defun is-project-p/bh ()
  "Any task with a todo keyword subtask."
  (save-restriction
    (widen)
    (let ((has-subtask)
          (subtree-end (save-excursion (org-end-of-subtree t)))
          (is-a-task (member (nth 2 (org-heading-components)) org-todo-keywords-1)))
      (save-excursion
        (forward-line 1)
        (while (and (not has-subtask)
                    (< (point) subtree-end)
                    (re-search-forward "^\*+ " subtree-end t))
          (when (member (org-get-todo-state) org-todo-keywords-1)
            (setq has-subtask t))))
      (and is-a-task has-subtask))))

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
		      ("@home" . ?h)
		      ("@computer" . ?c)
		      ("@kindle" . ?k)
		      ("@cellphone" . ?r)
		      ("@office" . ?o)
		      ("@errands" . ?i)
                      (:endgroup)
		      ("@coworker" . ?W)
		      (:newline)
		      (:startgrouptag)
		      ("computing" . ?C)
		      (:grouptags)
		      ("emacs" . ?e)
		      ("github" . ?g)
		      ("homelab" . ?l)
		      ("programming" . ?p)
		      ("website" . ?s)
		      (:endgrouptag)
		      (:startgrouptag)
		      ("personal" . ?P)
		      (:grouptags)
		      ("dreams" . ?d)
		      ("organizing" . ?z)
		      ("socials" . ?m)
		      (:endgrouptag)
		      ("humanities" . ?u)
		      ("translation" . ?t)
		      ("work" . ?w)
		      ))

(setq org-capture-templates
      `(("t" "Task" entry
	 (file+headline
	  ,(agenda-capture-helper "refile.org") "Tasks")
	 (file ,(org-capture-helper "task-template.org"))
	 :clock-in t :clock-resume t)

	("p" "Project" entry
	 (file+headline
	  ,(agenda-capture-helper "refile.org") "Projects")
	 (file ,(org-capture-helper "project-template.org"))
	 :clock-in t :clock-resume t)

	("m" "Meeting" entry
	 (file+headline
 	  ,(agenda-capture-helper "refile.org") "Meetings")
	 (file ,(org-capture-helper "meeting-template.org"))
	 :clock-in t :clock-resume t)

	("n" "Note" entry
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

(setq org-clock-in-switch-to-state 'clock-in-to-next/bh)

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

(advice-add 'org-refile :after (lambda (&rest _)
				 (org-save-all-org-buffers)))

;;* Appearance:


(provide 'tty-org)

;;; tty-org.el ends here
