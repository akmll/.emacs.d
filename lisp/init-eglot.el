;;; init-eglot.el --- Provide eglot mode initialization

;;; Commentary:
;;

(use-package breadcrumb
  :ensure t
  )

(use-package eglot
  :ensure t

  :bind
  (("C-c r" . eglot-rename)
   ("C-c d" . eglot-find-declaration)
   ("C-c h" . eldoc)
   ("M-N" . flymake-goto-next-error)
   ("M-P" . flymake-goto-prev-error))

  :hook
  (eglot-managed-mode . (lambda ()
                          (eglot-inlay-hints-mode -1)
                          (add-to-list 'header-line-format '(:eval (breadcrumb-imenu-crumbs)))
                          ))

  :custom
  (eglot-events-buffer-size 0)
  (eglot-autoshutdown t)
  (eglot-confirm-server-initiated-edits nil)
  (eglot-report-progress nil)
  )

(setq-default completions-sort nil)

(provide 'init-eglot)

;;; init-eglot.el ends here
