;;; init-csharp.el --- Initialize c# development environment

;;; Commentary:
;;

(require 'eglot)

(defun zap/csharp-mode-hook ()
  (eglot-ensure))

(use-package csharp-mode
  :ensure t
  :hook (csharp-mode . zap/csharp-mode-hook))

(provide 'init-csharp)

;;; init-csharp.el ends here
