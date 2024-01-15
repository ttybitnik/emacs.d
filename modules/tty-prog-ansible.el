;;; tty-prog-ansible.el --- Ansible Infrastructure as Code -*- lexical-binding: t -*-

;;; Commentary:

;; Ansible-related tunings.

;;; Code:

(require-package 'ansible)

;;* Variables:

;;* Functions:

(defun company-ansible/ttybitnik ()
  "Set up `company-mode' for `ansible'."
  (setq-local company-minimum-prefix-length 1)
  (setq-local company-backends '((company-capf
                                  company-dabbrev-code
                                  company-keywords
                                  company-files
                                  company-yasnippet))))

;;* Main:

;;* Bindings:

(global-set-key (kbd "C-c C-S-a") 'ansible)

;;* Hooks:

(add-hook 'ansible-hook (lambda ()
                          (yas-minor-mode)
                          (flycheck-mode)
                          (company-mode)
                          (eglot-ensure)
                          (company-ansible/ttybitnik)))

;;* Appearance:


(provide 'tty-prog-ansible)

;;; tty-prog-ansible.el ends here
