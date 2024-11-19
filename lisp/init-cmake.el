;;; init-cmake.el --- Provide cmake related functions

;;; Commentary:
;;

(use-package cmake-ts-mode
  :ensure
  :config
  (add-hook 'cmake-ts-mode-hook
            (defun setup-noecmakelsp ()
              (require 'eglot)
              (eglot-ensure))))

(provide 'init-cmake)

;;; init-cmake.el ends here
