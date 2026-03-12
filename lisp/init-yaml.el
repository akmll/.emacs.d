;;; init-yaml.el --- YAML related configuration  -*- lexical-binding: t; -*-

;;; Commentary:
;;

(use-package yaml-mode
  :ensure t
  :hook
  (yaml-mode . eglot-ensure))

(provide 'init-yaml)

;;; init-yaml.el ends here
