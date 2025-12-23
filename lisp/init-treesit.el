;;; init-treesit.el --- Initialize tree-sitter

;;; Commentary:
;;

(require 'treesit)

(use-package treesit-auto
  :if (treesit-available-p)
  :ensure t
  :custom
  (treesit-auto-install 'prompt)
  (treesit-auto-langs '(python
                        typescript
                        tsx
                        javascript
                        css
                        yaml
                        json
                        cmake))
  :config
  (treesit-auto-add-to-auto-mode-alist nil)
  (global-treesit-auto-mode))

(provide 'init-treesit)

;;; init-treesit.el ends here
