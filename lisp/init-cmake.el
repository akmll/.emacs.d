;;; init-cmake.el --- Provide cmake related functions

;;; Commentary:
;;

(require-package 'cmake-mode)
(require-package 'cmake-font-lock)

(with-eval-after-load 'cmake-mode
  (cmake-font-lock-activate))

(require 'eglot)

(add-hook 'cmake-mode-hook 'eglot-ensure)

(provide 'init-cmake)

;;; init-cmake.el ends here
