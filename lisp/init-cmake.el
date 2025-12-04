;;; init-cmake.el --- Provide cmake related functions

;;; Commentary:
;;

(use-package cmake-ts-mode
  :ensure
  :config
  (add-hook 'cmake-ts-mode-hook
            (defun setup-neocmakelsp ()
              (require 'eglot)
              (add-to-list 'eglot-server-programs `((cmake-ts-mode) . ("neocmakelsp" "stdio")))
              (eglot-ensure))))

(provide 'init-cmake)

;;; init-cmake.el ends here
