;;; init-javascript.el --- Provide configuration to javascript and related languages -*- lexical-binding: t -*-

;;; Commentary:
;;; Code:

(require-package 'json-mode)
(require-package 'js2-mode)
(require-package 'typescript-mode)
(require 'eglot)

(add-hook 'js-mode-hook 'eglot-ensure)
(add-hook 'typescript-mode-hook 'eglot-ensure)

(provide 'init-javascript)

;;; init-javascript.el ends here
