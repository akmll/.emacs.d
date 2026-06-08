;;; init-cov.el --- Initialize cov mode  -*- lexical-binding: t; -*-

;;; Commentary:
;;

(defun zap/find-lcov-info (file-name)
  (when (fboundp 'project-root)
    (when (fboundp 'project-current)
      (let ((proj-root (project-root (project-current file-name))))
        (if proj-root
            (let ((info-file (file-name-concat proj-root "build/coverage.info")))
              (if (file-exists-p info-file)
                  info-file
                nil)))))))

(defun zap/cov-c-mode-hook ()
  (let ((lcov-info (zap/find-lcov-info buffer-file-name)))
    (when lcov-info
      (setq cov-coverage-file (cons lcov-info 'lcov))
      (cov-mode 1))))

(use-package cov
  :ensure t
  :init
  (setq cov-coverage-alist nil)
  (setq cov-coverage-mode t)
  (setq cov-coverage-file-paths nil)
  (setq cov-mode nil)
  :diminish
  (cov-mode)
  :config
  (require 'project)
  :hook
  (c-mode-common . zap/cov-c-mode-hook)
  )

(provide 'init-cov)

;;; init-cov.el ends here
