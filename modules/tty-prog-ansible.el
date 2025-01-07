;;; tty-prog-ansible.el --- Ansible Infrastructure as Code -*- lexical-binding: t -*-

;;; Commentary:

;; Ansible-related tunings.

;;; Code:

(require-package 'ansible)

;;* Variables:

;;* Functions:

;;* Main:

;;* Bindings:

(global-set-key (kbd "C-c C-S-a") 'ansible)

;;* Hooks:

(add-hook 'ansible-hook (lambda ()
                          (yas-minor-mode)
                          (flymake-mode)
                          (eglot-ensure)))

;;* Appearance:


(provide 'tty-prog-ansible)

;;; tty-prog-ansible.el ends here
