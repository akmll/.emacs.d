;;; init-javascript.el --- Provide configuration to javascript and related languages -*- lexical-binding: t -*-

;;; Commentary:
;;; Code:

(require-package 'json-mode)
(require-package 'js2-mode)
(require-package 'typescript-mode)

(defun zap/javascript-mode-hook ()
  (setq comment-column 40)
  (setq fill-column 80)

  (lsp-deferred))

(add-hook 'js-mode-hook 'zap/javascript-mode-hook)
(add-hook 'typescript-mode-hook 'zap/javascript-mode-hook)

(provide 'init-javascript)

;;; init-javascript.el ends here
