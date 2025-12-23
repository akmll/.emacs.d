;;; init-cmake.el --- Provide cmake related functions

;;; Commentary:
;;

(use-package cmake-ts-mode
  :ensure t
  :if (treesit-available-p)
  :hook
  (cmake-ts-mode . (lambda ()
                     (require 'eglot)
                     (add-to-list 'eglot-server-programs `((cmake-ts-mode) . ("neocmakelsp" "stdio")))
                     (eglot-ensure))))

(use-package cmake-mode
  :ensure t
  :if (not (treesit-available-p))
  :hook
  (cmake-mode . (lambda ()
                  (require 'eglot)
                  (add-to-list 'eglot-server-programs `((cmake-mode) . ("neocmakelsp" "stdio")))
                  (eglot-ensure))))

(provide 'init-cmake)

;;; init-cmake.el ends here
