;;; init-treesit.el --- Initialize tree-sitter

;;; Commentary:
;;

(require 'treesit)

(use-package treesit-auto
  :ensure t
  :custom
  (treesit-auto-install 'prompt)
  :config
  (setq treesit-auto-langs '(python
                             typescript
                             tsx
                             javascript
                             css
                             yaml
                             json
                             cmake))
  (treesit-auto-add-to-auto-mode-alist nil)
  (global-treesit-auto-mode))

(provide 'init-treesit)

;;; init-treesit.el ends here
