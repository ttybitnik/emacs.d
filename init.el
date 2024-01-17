;;; init.el --- Personal Emacs Configuration -*- lexical-binding: t -*-

;; Copyright (c) 2022-2023 Vinicius Moraes

;; Author: Vinicius Moraes <vinicius.moraes@eternodevir.com>
;; Version: 0.1.0

;; URL: https://github.com/ttybitnik/emacs.d

;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:

;; Crafting Emacs like a luthier.

;;; Code:

;;* Variables:

(defconst emacs-d/ttybitnik
  (file-name-as-directory user-emacs-directory)
  "Absolute path of emacs.d directory.")

(defconst modules-d/ttybitnik
  (concat emacs-d/ttybitnik (file-name-as-directory "modules"))
  "Absolute path of modules directory.")

(defconst local-d/ttybitnik
  (concat user-emacs-directory (file-name-as-directory "local"))
  "Absolute path of local directory.")

(defconst img-d/ttybitnik
  (concat user-emacs-directory (file-name-as-directory "img"))
  "Absolute path of img directory.")

(defconst auth-d/ttybitnik
  (concat user-emacs-directory (file-name-as-directory ".auth"))
  "Absolute path of .auth directory.")

(defconst projects-d/ttybitnik
  (file-name-as-directory (getenv "TTY_GITHUB"))
  "Absolute path of projects directory.")

(defconst orpheusmx-d/ttybitnik
  (file-name-as-directory "~/.orpheus/gnu-emacs")
  "Absolute path of Emacs directory inside Orpheus.")

;;* Functions:

(defun require-package (package &optional no-refresh)
  "Install PACKAGE using `package-install' unless it's already installed.
If NO-REFRESH is non-nil, `package-refresh-contents' will be skipped."
  (unless (package-installed-p package)
    (unless no-refresh
      (package-refresh-contents))
    (package-install package))
  (require package))

(defun start-emacs-server ()
  "Start the Emacs server if it is not already running."
  (require 'server)
  (unless (server-running-p)
    (server-start)))

;;* Main:

(let* ((minver "28.2"))
  (when (version< emacs-version minver)
    (error "Emacs v%s or higher is required" minver)))

(package-initialize)

(setq package-archive-priorities
      '(("gnu" . 4)
	("nongnu" . 3)
	("melpa" . 2)
	("melpa-stable" . 1)))

(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives
	     '("melpa-stable" . "https://stable.melpa.org/packages/") t)

(let ((normal-gc-cons-threshold (* 20 1024 1024))
      (init-gc-cons-threshold (* 128 1024 1024)))
  (setq gc-cons-threshold init-gc-cons-threshold)
  (add-hook 'emacs-startup-hook
            (lambda () (setq gc-cons-threshold normal-gc-cons-threshold))))

(setq custom-file
      (locate-user-emacs-file "custom.el"))

(add-to-list 'load-path (expand-file-name modules-d/ttybitnik))

(require 'tty-func)
(require 'tty-com)
(require 'tty-dsg)
(require 'tty-misc)
(require 'tty-nav)
(require 'tty-org)
(require 'tty-prog)
(require 'tty-proj)
(require 'tty-publ)
(require 'tty-txt)
(require 'tty-vis)

(when (file-exists-p custom-file)
  (load custom-file))

;;* Bindings:

;;* Hooks:

(add-hook 'after-init-hook 'start-emacs-server)

;;* Appearance:


(provide 'init)

;;; Local Variables:
;;; no-byte-compile: t
;;; End:
;;; init.el ends here
