;;; init.el --- Personal Emacs Configuration -*- lexical-binding: t -*-

;; Copyright (C) 2022-2025 Vinícius Moraes

;; Author: Vinícius Moraes <vinicius.moraes@eternodevir.com>
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
  (expand-file-name user-emacs-directory)
  "Absolute name of emacs.d directory.")

(defconst modules-d/ttybitnik
  (expand-file-name (file-name-as-directory "modules") emacs-d/ttybitnik)
  "Absolute name of modules directory.")

(defconst local-d/ttybitnik
  (expand-file-name (file-name-as-directory "local") emacs-d/ttybitnik)
  "Absolute name of local directory.")

(defconst img-d/ttybitnik
  (expand-file-name (file-name-as-directory "img") emacs-d/ttybitnik)
  "Absolute name of img directory.")

(defconst auth-d/ttybitnik
  (expand-file-name (file-name-as-directory ".auth") emacs-d/ttybitnik)
  "Absolute name of .auth directory.")

(defconst projects-d/ttybitnik
  (expand-file-name (file-name-as-directory (getenv "TTY_GIT")))
  "Absolute name of projects directory.")

(defconst orpheus-d/ttybitnik
  (expand-file-name (file-name-as-directory (getenv "TTY_ORPHEUS")))
  "Absolute name of Orpheus directory.")

(defconst prometheus-d/ttybitnik
  (expand-file-name (file-name-as-directory (getenv "TTY_PROMETHEUS")))
  "Absolute name of Prometheus directory.")

(defconst orpheusmx-d/ttybitnik
  (expand-file-name (file-name-as-directory "gnu-emacs") orpheus-d/ttybitnik)
  "Absolute name of Emacs directory inside Orpheus.")

(defvar skip-refresh/ttybitnik nil
  "Optimize `package-refresh-contents' in `require-package'.")

;;* Functions:

(defun require-package (package &optional no-refresh)
  "Install PACKAGE using `package-install' unless it's already installed.
If NO-REFRESH is non-nil, `package-refresh-contents' will be skipped.

The global variable `skip-refresh/ttybitnik' ensures that
`package-refresh-contents' is called only once.  This is
especially important for fresh installs when multiple calls are
made in sequence."
  (unless (package-installed-p package)
    (unless (or no-refresh
		skip-refresh/ttybitnik)
      (package-refresh-contents)
      (setq skip-refresh/ttybitnik t))
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

;; require early
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
