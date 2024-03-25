;;; init-javascript.el --- Provide configuration to javascript and related languages -*- lexical-binding: t -*-

;;; Commentary:
;;; Code:

(require-package 'js2-mode)

(require 'eglot)

(defun zap/javascript-mode-hook ()
  (setq comment-column 40)
  (eglot-ensure))

(setq typescript-ts-mode-indent-offset 4)
(setq js-ts-mode-indent-offset 4)
(setq json-ts-mode-indent-offset 4)

(add-to-list 'auto-mode-alist '("\\.ts\\'" . typescript-ts-mode))
(add-to-list 'auto-mode-alist '("\\.tsx\\'" . tsx-ts-mode))

(add-hook 'js-mode-hook 'zap/javascript-mode-hook)
(add-hook 'js2-mode-hook 'zap/javascript-mode-hook)
(add-hook 'tsx-ts-mode-hook 'zap/javascript-mode-hook)

(provide 'init-javascript)

;;; init-javascript.el ends here
