;;; init-elpa.el --- Settings and helpers for package.el -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'cl-lib)
(require 'package)

;;; Install into separate package dirs for each Emacs version, to prevent bytecode incompatibility
(setq package-user-dir
      (expand-file-name (format "elpa-%s.%s" emacs-major-version emacs-minor-version)
                        user-emacs-directory))
(setq package-gnupghome-dir (expand-file-name "gnupg" package-user-dir))

;;; Standard package repositories
(add-to-list 'package-archives '( "melpa-cn" . "https://mirrors.ustc.edu.cn/elpa/melpa/") t)
(setq package-archive-priorities '(("gnu" . 10)
                                   ("nognu" . 5)
                                   ("melpa-cn" . 0)))

(require 'use-package)

(setq package-enable-at-startup nil)
(package-initialize)

(use-package diminish
  :ensure t)

(use-package scratch
  :ensure t)

(use-package command-log-mode
  :ensure t)

(provide 'init-elpa)
;;; init-elpa.el ends here
