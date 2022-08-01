;;; init-lsp.el --- Settings of the lsp-mode(Language Server Protocol)
;;; Commentary:
;;; Code:

(require-package 'lsp-mode)
(setq lsp-enable-snippet nil)
(setq lsp-keep-workspace-alive nil)

(require-package 'lsp-ui)
(setq lsp-ui-sideline-show-code-actions t)
(setq lsp-ui-sideline-show-diagnostics t)
(setq lsp-ui-sideline-show-hover nil)
(setq lsp-ui-sideline-show-symbol t)
(setq lsp-ui-doc-position 'bottom)

(with-eval-after-load 'lsp-mode
  (diminish 'lsp-lens-mode))

(require-package 'lsp-treemacs)
(lsp-treemacs-sync-mode 1)

(require-package 'lsp-ivy)

(setq gc-cons-threshold 100000000)
(setq read-process-output-max (* 1024 1024))
(setq lsp-idle-delay 0.500)
(setq lsp-log-io nil)
(setq lsp-enable-on-type-formatting nil)

(with-eval-after-load 'lsp-mode
  (add-hook 'lsp-mode-hook #'lsp-enable-which-key-integration)
  (define-key lsp-mode-map (kbd "C-c l") lsp-command-map))

(require-package 'consult-lsp)

(provide 'init-lsp)
;;; init-lsp.el ends here
