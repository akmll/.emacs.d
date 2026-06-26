;;; init.el --- Emacs configuration  -*- lexical-binding: t; -*-
;;; Commentary:

;; This is the entry of the configuration


;;; Code:

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(setq user-emacs-custom-directory (expand-file-name ".emacs.custom.d" "~/"))
(setq custom-file (expand-file-name "custom.el" user-emacs-custom-directory))

;; Bootstrap config
(require 'init-utils)
(require 'init-site-lisp)
(require 'init-elpa)

(require 'init-ui)
(require 'init-misc)
(require 'init-sessions)
(require 'init-ivy)
(require 'init-eglot)
(require 'init-editting)
(require 'init-vc)
(require 'init-org)
(require 'init-projectile)
(require 'init-yasnippet)
(require 'init-comint)
(require 'init-treesit)

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
(require 'init-json)
(require 'init-cov)
(require 'init-copilot)
(require 'init-theme)

;; Start server
(add-hook 'after-init-hook
          (lambda ()
            (require 'server)
            (unless (server-running-p)
              (server-start))))

;; Re-direct custom configuration file
(load custom-file t)

(provide 'init)
;; init.el ends here
