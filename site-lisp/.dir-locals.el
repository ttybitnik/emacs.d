;;; Directory Local Variables            -*- no-byte-compile: t -*-
;;; For more information see (info "(emacs) Directory Variables")

((emacs-lisp-mode . ((eval . (add-hook 'flymake-diagnostic-functions
                                       #'package-lint-flymake nil t)))))
