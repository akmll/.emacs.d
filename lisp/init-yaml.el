;;; init-yaml.el --- YAML related configuration

;;; Commentary:
;;

(use-package yaml-mode
  :ensure t
  :hook
  (yaml-mode . eglot-ensure))

(provide 'init-yaml)

;;; init-yaml.el ends here
