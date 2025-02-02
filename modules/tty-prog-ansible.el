;;; tty-prog-ansible.el --- Ansible Infrastructure as Code -*- lexical-binding: t -*-

;;; Commentary:

;; Ansible-related tunings.

;;; Code:

(require-package 'ansible)

;;* Variables:

;;* Functions:

(defun ansible-mode/ttybitnik ()
  "Set up `ansible-mode' hooks."
  (yas-minor-mode)
  (flymake-mode)
  (eglot-ensure))

;;* Main:

;;* Bindings:

(global-set-key (kbd "C-c C-S-a") 'ansible)

;;* Hooks:

(add-hook 'ansible-mode-hook 'ansible-mode/ttybitnik)

;;* Appearance:


(provide 'tty-prog-ansible)

;;; tty-prog-ansible.el ends here
