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
(require 'init-projectile)
(require 'init-editting)
(require 'init-vc)

;; programming languages
(require 'init-cc-mode)
(require 'init-python)
(require 'init-rust)

(require-package 'yaml-mode)


;; Start server otherwise magit commit would fail
(add-hook 'after-init-hook 'zap/server-start)

;; Re-direct custom configuration file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))

;; theme must be initialized after custom configration loaded
(require 'init-theme)

(provide 'init)
;; init.el ends here
