;;; init.el --- Emacs configuration
;;; Commentary:

;; This is the entry of the configuration


;;; Code:

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

;; Bootstrap config
(require 'init-utils)
(require 'init-site-lisp)
(require 'init-elpa)

(require-package 'diminish)
(require-package 'scratch)
(require-package 'command-log-mode)

(require 'init-ui)
(require 'init-misc)
(require 'init-sessions)
(require 'init-ivy)
(require 'init-flycheck)
(require 'init-eglot)
(require 'init-editting)
(require 'init-vc)
(require 'init-realgud)
(require 'init-org)
(require 'init-projectile)
(require 'init-yasnippet)
(require 'init-pdf)

;; programming languages
(require 'init-cmake)
(require 'init-cc-mode)
(require 'init-python)
(require 'init-rust)
(require 'init-javascript)
(require 'init-yaml)
(require 'init-hex)
(require 'init-csharp)
(require 'init-batch)

;; Start server
(add-hook 'after-init-hook
          (lambda ()
            (require 'server)
            (unless (server-running-p)
              (server-start))))

;; Re-direct custom configuration file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))

;; theme must be initialized after custom configration loaded
(require 'init-theme)

(provide 'init)
;; init.el ends here
