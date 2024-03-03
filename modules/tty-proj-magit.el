;;; tty-proj-magit.el --- Magit -*- lexical-binding: t -*-

;;; Commentary:

;; Magit-related tunings.

;;; Code:

(require-package 'magit)

;;* Variables:

(defvar conventional-commit-types/ttybitnik
  '("feat" "fix" "refactor" "perf" "style" "test" "docs" "chore" "build" "ci"
    "revert" "deps")
  "List of conventional commit types to be enforced.")

;;* Functions:

(defun magit-query-conventional-commit/ttybitnik (&optional force)
  "Prompt the user for conventional commit validation.
If FORCE is non-nil, this function will proceed without prompting the user."
  (or force
      (save-excursion
        (goto-char (point-min))
        (and
         (if (re-search-forward
              (rx-to-string `(seq
                              (or ,@conventional-commit-types/ttybitnik)
                              (zero-or-one "(" (one-or-more anything) ")")
                              (zero-or-one "!")
                              ": "))
              nil t)
             t
           (y-or-n-p "No type/scope defined.  Commit anyway?"))
         (if (re-search-forward
	      (rx-to-string '(seq
			      (one-or-more (not whitespace))
			      eol))
	      nil t)
	     t
           (y-or-n-p "No description after type/scope.  Commit anyway?"))))))

;;* Main:

(setq magit-push-always-verify nil)
(setq git-commit-summary-max-length 50)

(add-to-list 'git-commit-finish-query-functions
	     #'magit-query-conventional-commit/ttybitnik)

;;* Bindings:

(global-set-key (kbd "M-m") ' magit-status)

;;* Hooks:

;;* Appearance:


(provide 'tty-proj-magit)

;;; tty-proj-magit.el ends here
