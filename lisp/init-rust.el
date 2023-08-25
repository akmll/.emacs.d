;;; init-rust.el --- Support for the Rust language -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'eglot)

(require-package 'rustic)

(add-hook 'conf-toml-mode-hook
          (lambda ()
            (eglot-ensure)))

(provide 'init-rust)
;;; init-rust.el ends here
