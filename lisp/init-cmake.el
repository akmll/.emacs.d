;;; init-cmake.el --- Provide cmake related functions  -*- lexical-binding: t; -*-

;;; Commentary:
;;

(defun eglot-cmake-mode-hook ()
  (require 'eglot)
  (eglot-ensure))

(use-package cmake-ts-mode
  :ensure t
  :if (treesit-available-p)
  :hook
  (cmake-ts-mode . eglot-cmake-mode-hook)
  :config
  ;; (add-to-list 'eglot-server-programs `((cmake-ts-mode) . ("neocmakelsp" "stdio")))
  )

(use-package cmake-mode
  :ensure t
  :if (not (treesit-available-p))
  :hook
  (cmake-mode . eglot-cmake-mode-hook)
  :config
  ;; (add-to-list 'eglot-server-programs `((cmake-mode) . ("neocmakelsp" "stdio")))
  )

(provide 'init-cmake)

;;; init-cmake.el ends here
