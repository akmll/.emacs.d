;;; init-json.el --- Initialize json-mode  -*- lexical-binding: t; -*-

;;; Commentary:
;;

(use-package eglot
  :ensure t
  :hook ((json-mode . eglot-ensure)
         (json-ts-mode . eglot-ensure))
  )

(provide 'init-json)

;;; init-json.el ends here
