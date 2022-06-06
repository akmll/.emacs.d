;;; init-csharp.el --- Initialize c# development environment

;;; Commentary:
;;

(require-package 'csharp-mode)

(require-package 'lsp-mode)
(require 'lsp-csharp)

(require-package 'dap-mode)
(require 'dap-netcore)

(add-hook 'csharp-mode-hook 'lsp-deferred)

(provide 'init-csharp)

;;; init-csharp.el ends here
