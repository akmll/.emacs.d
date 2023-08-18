;;; init-csharp.el --- Initialize c# development environment

;;; Commentary:
;;

(use-package csharp-mode
  :ensure t
  :hook (csharp-mode . eglot-ensure)
  )

;; (setq-default omnisharp-roslyn-path (concat user-emacs-directory ".cache/lsp/omnisharp-roslyn/latest/omnisharp.exe"))
;; (with-eval-after-load 'eglot
;;   (add-to-list 'eglot-server-programs
;;                `((csharp-mode csharp-ts-mode) . (,(expand-file-name omnisharp-roslyn-path) "--lsp"))
;;                ))

(provide 'init-csharp)

;;; init-csharp.el ends here
