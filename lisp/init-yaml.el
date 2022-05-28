;;; init-yaml.el --- YAML related configuration

;;; Commentary:
;;

(require-package 'yaml-mode)
(require-package 'lsp-mode)

(add-hook 'yaml-mode-hook 'lsp-deferred)

(provide 'init-yaml)

;;; init-yaml.el ends here
