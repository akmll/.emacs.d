;;; init-tramp.el --- Initialize TRAMP mode

;;; Commentary:
;;

(require 'tramp)
(setq tramp-default-method "ssh")
(setq tramp-verbose 11)

(provide 'init-tramp)

(require 'lsp-mode)
(lsp-register-client
 (make-lsp-client :new-connection (lsp-tramp-connection "clangd")
                  :major-modes '(c-mode c++-mode)
                  :remote? t
                  :server-id 'clangd-remote))

;;; init-tramp.el ends here
