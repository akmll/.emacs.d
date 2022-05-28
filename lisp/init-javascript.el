;;; init-javascript.el --- Provide configuration to javascript and related languages -*- lexical-binding: t -*-

;;; Commentary:
;;; Code:

(require-package 'json-mode)
(require-package 'js2-mode)
(require-package 'typescript-mode)

(add-hook 'js-mode-hook 'lsp-deferred)
(add-hook 'typescript-mode-hook 'lsp-deferred)

(provide 'init-javascript)

;;; init-javascript.el ends here
