;;; init-rust.el --- Support for the Rust language -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require-package 'rust-mode)
(require-package 'racer)
(add-hook 'rust-mode-hook #'racer-mode)

(require-package 'company)
(add-hook 'racer-mode-hook #'company-mode)

(require-package 'flycheck-rust)
(after-load 'rust-mode
  (add-hook 'flycheck-mode-hook #'flycheck-rust-setup))

(provide 'init-rust)
;;; init-rust.el ends here
