;;; init-elpa.el --- Settings and helpers for package.el -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'package)

;; Disable checking package signature to workround gnu elpa issue
(setq package-check-signature nil)

;;; Install into separate package dirs for each Emacs version, to prevent bytecode incompatibility
(let ((versioned-package-dir
       (expand-file-name (format "elpa-%s.%s" emacs-major-version emacs-minor-version)
                         user-emacs-directory)))
  (setq package-user-dir versioned-package-dir))

;;; Install packages if necessary
(defun require-package (package &optional min-version no-refresh)
  "Install given PACKAGE, optionally requiring MIN-VERSION.
If NO-REFRESH is non-nil, the available package lists will not be
re-downloaded in order to locate PACKAGE."
  (or (package-installed-p package min-version)
      (let* ((known (cdr (assoc package package-archive-contents)))
             (versions (mapcar #'package-desc-version known)))
        (if (cl-find-if (lambda (v) (version-list-<= min-version v)) versions)
            (package-install package)
          (if no-refresh
              (error "No version of %s >= %S is available" package min-version)
            (package-refresh-contents)
            (require-package package min-version t))))))


;;; Standard package repositories
(setq package-archives
      '(("gnu"          . "https://elpa.gnu.org/packages/")
	("melpa"        . "https://melpa.org/packages/")))

(setq package-enable-at-startup nil)

(package-initialize)

(require 'cl-lib)
(require-package 'fullframe)
(fullframe list-packages quit-window)

(provide 'init-elpa)
;;; init-elpa.el ends here
