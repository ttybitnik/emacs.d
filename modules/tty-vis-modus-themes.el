;;; tty-vis-modus-themes.el --- Modus Themes -*- lexical-binding: t -*-

;;; Commentary:

;; Modus-themes related tunings.

;;; Code:
(require-package 'modus-themes)


;;* Variables:

;;* Functions:

;;* Main:

(setq modus-themes-org-blocks 'tinted-background)

(custom-set-variables
 '(org-src-block-faces
   '(("emacs-lisp" modus-themes-nuanced-magenta)
     ("elisp" modus-themes-nuanced-magenta)
     ("clojure" modus-themes-nuanced-magenta)
     ("clojurescript" modus-themes-nuanced-magenta)
     ("ipython" modus-themes-nuanced-magenta)
     ("c" modus-themes-nuanced-blue)
     ("c++" modus-themes-nuanced-blue)
     ("go" modus-themes-nuanced-blue)
     ("sh" modus-themes-nuanced-green)
     ("shell" modus-themes-nuanced-green)
     ("python" modus-themes-nuanced-green)
     ("html" modus-themes-nuanced-yellow)
     ("xml" modus-themes-nuanced-yellow)
     ("css" modus-themes-nuanced-red)
     ("scss" modus-themes-nuanced-red)
     ("r" modus-themes-nuanced-red)
     ("yaml" modus-themes-nuanced-cyan)
     ("toml" modus-themes-nuanced-cyan)
     ("conf" modus-themes-nuanced-cyan)
     ("docker" modus-themes-nuanced-cyan))))

;;* Bindings:

;;* Hooks:

;;* Appearance:


(provide 'tty-vis-modus-themes)

;;; tty-vis-modus-themes.el ends here
