;;; tty-org.el --- Org-mode Module -*- lexical-binding: t -*-

;;; Commentary:

;; This module tailors settings and packages for org-mode in Emacs.

;;; Code:

(require 'org)
(require 'notifications)
(require-package 'org-ql)
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
  "Absolute path of `org-agenda' directory inside Orpheus.")

;;* Functions:

(defun org-capture-helper (template)
  "Expand TEMPLATE filename for `org-capture-templates'.
It returns the absolute path from local templates in
`local-d/ttybitnik' org directory."
  (expand-file-name
   template (concat local-d/ttybitnik (file-name-as-directory "org"))))

(defun agenda-helper (agenda-file)
  "Expand AGENDA-FILE filename for `org-capture-templates'.
It returns the absolute path from an `org-agenda' file in
`agenda-d/ttybitnik'."
  (expand-file-name agenda-file agenda-d/ttybitnik))

(defun clock-in-parent-task/bh ()
  "Move cursor to the parent (project) task if any and clock in."
  (let ((parent-task))
    (save-excursion
      (save-restriction
        (widen)
        (while (and (not parent-task) (org-up-heading-safe))
          (when (member (nth 2 (org-heading-components)) org-todo-keywords-1)
            (setq parent-task (point))))
        (if parent-task
            (org-with-point-at parent-task
              (org-clock-in)))))))

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

(defun pomodoro/ttybitnik ()
  "Start a custom pomodoro session.
This function sets up a pomodoro timer for a session duration of 50 minutes
followed by a break duration of 10 minutes.

This function displays system notifications using `notifications-notify' and
opens an `org-capture' buffer to allow pausing any active `org-clock-in' clock
during the break time.  Once the break time ends, an alarm sound is played using
`call-process-shell-command'.

The recommended workflow is to add an `org-clock-in-hook' to run this function
unless an `org-timer-countdown-timer' is already running.

Otherwise, call it interactively with \\[pomodoro/ttybitnik]."
  (interactive)
  (let* ((session-duration 50)
         (session-break 10)
         (title-message "Pomodoro 🍅")
         (duration-message (format "Timer: %d minutes" session-duration))
         (break-message (format "Break: %d minutes" session-break))
	 (over-message "Break time is up!"))
    (notifications-notify
     :title title-message
     :body duration-message
     :urgency 'normal)
    (org-timer-set-timer session-duration)
    (run-with-timer (+ (* session-duration 60) 1) nil
                    (lambda ()
                      (notifications-notify
                       :title title-message
                       :body break-message
                       :urgency 'critical)
                      (org-timer-set-timer session-break)
                      (message "Pomodoro. %s" break-message)
                      (org-capture nil "t")
                      (insert "Pomodoro break 🍅")))
    (run-with-timer (* (+ session-duration session-break) 60) nil
		    (lambda ()
		      (notifications-notify
		       :title title-message
		       :body over-message
		       :urgency 'normal)
                      (message "Pomodoro. %s" over-message)
		      (call-process-shell-command
		       "paplay /usr/share/sounds/freedesktop/stereo/alarm-clock-elapsed.oga"
		       nil 0)))
    (message "Pomodoro. %s" duration-message)))

(defun org-agenda-binding-next/ttybitnik ()
  "Set quality of life next item movement/binding for `org-agenda'."
  (interactive)
  (org-agenda-next-item 1)
  (move-beginning-of-line 1))

(defun org-agenda-binding-previous/ttybitnik ()
  "Set quality of life previous item movement/binding for `org-agenda'."
  (interactive)
  (org-agenda-previous-item 1)
  (move-beginning-of-line 1))

;;* Main:

(setq org-duration-units `(("min" . 1)
			   ("h" . 60)
			   ("d" . ,(* 60 8))
			   ("w" . ,(* 60 8 5))
			   ("m" . ,(* 60 8 5 4))
			   ("y" . ,(* 60 8 5 4 10))))

(setq org-src-preserve-indentation t)
(setq org-ellipsis " ")
(setq org-startup-folded 'show10levels)
(setq org-use-speed-commands t)
(setq org-src-fontify-natively t)
(setq org-src-tab-acts-natively t)
(setq org-confirm-babel-evaluate t)
(setq org-export-with-smart-quotes t)
(setq org-src-window-setup 'current-window)
(setq org-babel-python-command "python3")
(setq org-refile-targets '((nil :maxlevel . 1)
			   (org-agenda-files :maxlevel . 1)))
(setq org-agenda-files `(,(concat agenda-d/ttybitnik)))

(setq org-tag-alist '((:startgroup)
		      ("@home" . ?h)
		      ("@computer" . ?c)
		      ("@kindle" . ?k)
		      ("@cellphone" . ?r)
		      ("@office" . ?o)
		      ("@errands" . ?i)
                      (:endgroup)
		      ("@persons" . ?n)
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
		      ("humanities" . ?u)
		      ("dreams" . ?d)
		      ("books" . ?v)
		      ("socials" . ?m)
		      ("blog" . ?b)
		      ("organizing" . ?z)
		      (:endgrouptag)
		      (:startgrouptag)
		      ("professional" . ?W)
		      (:grouptags)
		      ("translation" . ?t)
		      ("work" . ?w)
		      (:endgrouptag)
		      ("FLAGGED" . ?F)))

(setq org-capture-templates
      `(("t" "Task" entry
	 (file+headline
	  ,(agenda-helper "refile.org") "Tasks")
	 (file ,(org-capture-helper "task-template.org"))
	 :clock-in t :clock-resume t)
	("p" "Project" entry
	 (file+headline
	  ,(agenda-helper "refile.org") "Projects")
	 (file ,(org-capture-helper "project-template.org"))
	 :clock-in t :clock-resume t)
	("m" "Meeting" entry
	 (file+headline
 	  ,(agenda-helper "refile.org") "Meetings")
	 (file ,(org-capture-helper "meeting-template.org"))
	 :clock-in t :clock-resume t)
	("n" "Note" entry
	 (file+headline
 	  ,(agenda-helper "refile.org") "Notes")
	 (file ,(org-capture-helper "note-template.org"))
	 :clock-in t :clock-resume t)
	("j" "Journal" entry
	 (file+olp+datetree ,(agenda-helper "journal.org"))
	 (file ,(org-capture-helper "journal-template.org"))
	 :clock-in t :clock-resume t)))

(setq org-todo-keywords
      '((sequence "TODO(t)" "NEXT(n)" "WAIT(h@)"
		  "|" "MEET(m)" "DONE(d)" "CANCELED(c@/!)")))

(org-babel-do-load-languages 'org-babel-load-languages
			     '((emacs-lisp . t)
			       (shell . t)
			       (python . t)
			       (C . t)
			       (plantuml . t)))

;; (setq org-agenda-window-setup 'current-window)
(setq org-agenda-start-on-weekday 0)
(setq org-agenda-show-all-dates t)
(setq org-agenda-sticky t)
(setq org-agenda-start-with-log-mode t)
;; (setq org-agenda-log-mode-items '(closed))
(setq org-agenda-persistent-filter t)
(setq org-agenda-text-search-extra-files '(agenda-archives))
(setq org-deadline-warning-days 30)
(setq org-tags-match-list-sublevels t)

(setq org-log-done 'time)
(setq org-log-into-drawer t)
(setq org-enforce-todo-dependencies t)
(setq org-agenda-dim-blocked-tasks nil)
(setq org-stuck-projects (quote ("" nil nil "")))

(org-clock-persistence-insinuate)
(add-to-list 'org-modules 'org-timer)
(setq org-timer-default-timer 50)
(setq org-clock-in-switch-to-state 'clock-in-to-next/bh)
(setq org-clock-out-remove-zero-time-clocks t)
(setq org-agenda-use-time-grid t)
(setq org-agenda-skip-additional-timestamps-same-entry t)
(setq org-clock-in-resume t)
(setq org-clock-persist t)
;; (setq org-clock-persist-query-resume nil)
(setq org-clock-report-include-clocking-task t)

(setq org-agenda-clockreport-parameter-plist
      (quote (:link t :maxlevel 5 :fileskip0 t :compact t :narrow 80)))
(setq org-agenda-clock-consistency-checks
      (quote (:max-duration "4:00"
              :min-duration 0
              :max-gap 0
              :gap-ok-around ("4:00"))))

(setq org-custom-agenda/ttybitnik
      `((agenda "" ((org-agenda-span 3)))
	(org-ql-block '(and  (todo)
			     (children)
			     (not (todo "WAIT" "NEXT"))
			     (not (children (todo "NEXT"))))
		      ((org-ql-block-header "Stuck projects:")))
	(org-ql-block '(and  (todo)
			     (children (todo "NEXT")))
		      ((org-ql-block-header "Projects:")
		       (org-agenda-files '(,(agenda-helper "project.org")))))
	(org-ql-block '(and (todo "NEXT")
			    (not (level 2)))
		      ((org-ql-block-header "Projects next tasks:")
		       (org-agenda-files '(,(agenda-helper "project.org")))))
	(org-ql-block '(and (todo "TODO")
			    (not (children))
			    (not (level 2)))
		      ((org-ql-block-header "Projects subtasks:")
		       (org-agenda-files '(,(agenda-helper "project.org")))))
	(org-ql-block '(and (todo "NEXT")
			    (not (parent (todo)))
			    (not (children)))
		      ((org-ql-block-header "Next tasks:")))
	(org-ql-block '(and (todo "TODO")
			    (not (parent (todo)))
			    (not (children)))
		      ((org-ql-block-header "Standalone tasks:")
		       (org-agenda-files '(,(agenda-helper "task.org")))))
	(org-ql-block '(and (todo)
			    (not (todo "TODO" "NEXT")))
		      ((org-ql-block-header "Waiting and postponed tasks:")))
	(org-ql-block '(and (parent (heading "Someday"))
			    (todo "TODO"))
		      ((org-ql-block-header "Stuck tasks (someday):")
		       (org-agenda-files '(,(agenda-helper "someday.org")))))))

(setq org-custom-agenda-gtd/ttybitnik
      `((agenda "" ((org-agenda-span 14)
		    (org-agenda-start-on-weekday nil)))
	(org-ql-block '(and (todo "MEET")
			    (level 2))
		      ((org-ql-block-header "Meetings to refile:")
		       (org-agenda-files '(,(agenda-helper "refile.org")))))
	(org-ql-block '(and (or (parent (heading "Projects"))
				(parent (heading "Tasks")))
			    (level 2)
			    (children))
		      ((org-ql-block-header "Projects to refile:")
		       (org-agenda-files '(,(agenda-helper "refile.org")))))
	(org-ql-block '(and (parent (heading "Tasks"))
			    (level 2)
			    (not (children)))
		      ((org-ql-block-header "Tasks to refile:")
		       (org-agenda-files '(,(agenda-helper "refile.org")))))
	(org-ql-block '(and (parent (heading "Notes"))
			    (level 2))
		      ((org-ql-block-header "Notes to refile:")
		       (org-agenda-files '(,(agenda-helper "refile.org")))))
	(org-ql-block '(and  (todo)
			     (children)
			     (not (todo "WAIT" "NEXT"))
			     (not (children (todo "NEXT"))))
		      ((org-ql-block-header "Stuck projects::")))
	(org-ql-block '(and (todo)
			    (not (todo "TODO" "NEXT")))
		      ((org-ql-block-header "Waiting and postponed tasks:")))
	(org-ql-block '(and (parent (heading "Someday"))
			    (todo "TODO"))
		      ((org-ql-block-header "Stuck tasks (someday):")
		       (org-agenda-files '(,(agenda-helper "someday.org")))))
	(org-ql-block '(and (done)
			    (ts :to -30))
		      ((org-ql-block-header "Tasks to archive:")))))

(setq org-agenda-custom-commands
      `(("n" "Agenda for general view"
	 ,org-custom-agenda/ttybitnik)
	("w" "Agenda for professional context"
	 ,org-custom-agenda/ttybitnik
	 ((org-agenda-tag-filter-preset '("+professional")))
	 (nil))
	("p" "Agenda for personal context"
	 ,org-custom-agenda/ttybitnik
	 ((org-agenda-tag-filter-preset '("+personal")))
	 (nil))
	("c" "Agenda for computing context"
	 ,org-custom-agenda/ttybitnik
	 ((org-agenda-tag-filter-preset '("+computing")))
	 (nil))
	("g" "Agenda for organizing the week (GTD)"
	 ,org-custom-agenda-gtd/ttybitnik)
	("P" "Printed version of agenda"
	 ,org-custom-agenda/ttybitnik
	 ((org-agenda-with-colors nil)
	  (org-agenda-start-with-log-mode nil)
          (org-agenda-prefix-format "%t %s")
          (org-agenda-current-time-string ,(car (last org-agenda-time-grid)))
          (org-agenda-fontify-priorities nil)
          (org-agenda-remove-tags t)))))

;;* Bindings:

(define-key org-agenda-mode-map (kbd "n") 'org-agenda-binding-next/ttybitnik)
(define-key org-agenda-mode-map (kbd "p") 'org-agenda-binding-previous/ttybitnik)
(define-key org-agenda-mode-map (kbd "j") 'org-agenda-binding-next/ttybitnik)
(define-key org-agenda-mode-map (kbd "k") 'org-agenda-binding-previous/ttybitnik)

(global-set-key (kbd "C-c '") 'org-edit-src-code)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c c") 'org-capture)

;;* Hooks:

(add-hook 'org-mode-hook (lambda ()
			   (visual-line-mode)
			   (variable-pitch-mode)
			   (org-indent-mode)
			   (yas-minor-mode)))

(add-hook 'org-agenda-mode-hook (lambda ()
				  (hl-line-mode)
				  (beacon-mode nil)))

(add-hook 'org-clock-in-hook (lambda ()
			       (unless org-timer-countdown-timer
				 (pomodoro/ttybitnik))))

(add-hook 'org-clock-out-hook 'clock-in-parent-task/bh)

(advice-add 'org-refile :after (lambda (&rest _)
				 (org-save-all-org-buffers)))

;;* Appearance:


(provide 'tty-org)

;;; tty-org.el ends here
