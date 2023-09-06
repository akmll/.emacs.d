;;; init-csharp.el --- Initialize c# development environment

;;; Commentary:
;;

(require-package 'csharp-mode)

(require-package 'lsp-mode)
(require 'lsp-csharp)

(require-package 'dap-mode)
(require 'dap-netcore)

(defun zap/csharp-mode-hook ()
  (lsp-deferred))

(add-hook 'csharp-mode-hook 'zap/csharp-mode-hook)

(provide 'init-csharp)

;;; init-csharp.el ends here
