;;; init-cmake.el --- Provide cmake related functions

;;; Commentary:
;;

(require-package 'cmake-mode)
(require-package 'cmake-font-lock)

(with-eval-after-load 'cmake-mode
  (cmake-font-lock-activate))

(require-package 'lsp-mode)
(require 'lsp-cmake)

(add-hook 'cmake-mode-hook 'lsp-deferred)

(provide 'init-cmake)

;;; init-cmake.el ends here
