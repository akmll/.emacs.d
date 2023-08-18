;;; init-eglot.el --- Provide eglot mode initialization

;;; Commentary:
;;

(use-package eglot
  :ensure t

  :bind
  (("C-c r" . eglot-rename))

  :hook
  (eglot-managed-mode . (lambda () (eglot-inlay-hints-mode -1)))

  :custom
  (eglot-autoshutdown t)
  (eglot-confirm-server-initiated-edits nil)
  )

(provide 'init-eglot)

;;; init-eglot.el ends here
