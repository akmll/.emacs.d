;;; init-rust.el --- Support for the Rust language -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'eglot)

(use-package rustic
  :ensure t
  :custom
  (rustic-lsp-client 'eglot))

(add-hook 'conf-toml-mode-hook
          (lambda ()
            (eglot-ensure)))

(provide 'init-rust)
;;; init-rust.el ends here
