;;; init-rust.el --- Support for the Rust language -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require-package 'lsp-mode)
(require-package 'dap-mode)

(require 'dap-codelldb)

(require-package 'rustic)

(add-hook 'conf-toml-mode-hook
          (lambda ()
            (lsp-deferred)))

(provide 'init-rust)
;;; init-rust.el ends here
