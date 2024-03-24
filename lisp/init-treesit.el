;;; init-treesit.el --- Initialize tree-sitter

;;; Commentary:
;;

(require 'treesit)

(use-package treesit-auto
  :custom
  (treesit-auto-install 'prompt)
  :config
  (global-treesit-auto-mode))

(defvar genehack/tsx-treesit-auto-recipe
  (make-treesit-auto-recipe
   :lang 'tsx
   :ts-mode 'tsx-ts-mode
   :remap '(typescript-tsx-mode)
   :requires 'typescript
   :url "https://github.com/tree-sitter/tree-sitter-typescript"
   :revision "v0.20.3"
   :source-dir "tsx/src"
   :ext "\\.tsx\\'")
  "Recipe for libtree-sitter-tsx.dylib")
(add-to-list 'treesit-auto-recipe-list genehack/tsx-treesit-auto-recipe)

(defvar genehack/typescript-treesit-auto-recipe
  (make-treesit-auto-recipe
   :lang 'typescript
   :ts-mode 'typescript-ts-mode
   :remap 'typescript-mode
   :requires 'tsx
   :url "https://github.com/tree-sitter/tree-sitter-typescript"
   :revision "v0.20.3"
   :source-dir "typescript/src"
   :ext "\\.ts\\'")
  "Recipe for libtree-sitter-typescript.dylib")
(add-to-list 'treesit-auto-recipe-list genehack/typescript-treesit-auto-recipe)

(provide 'init-treesit)

;;; init-treesit.el ends here
