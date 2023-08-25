;;; init-yaml.el --- YAML related configuration

;;; Commentary:
;;

(require-package 'yaml-mode)

(add-hook 'yaml-mode-hook 'eglot-ensure)

(provide 'init-yaml)

;;; init-yaml.el ends here
