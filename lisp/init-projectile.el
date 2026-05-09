;;; init-projectile.el  -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(use-package projectile
  :ensure t
  :hook
  (after-init . projectile-mode)
  :custom
  (projectile-mode-line-prefix " Proj")
  (projectile-indexing-method 'alien)
  (projectile-enable-caching t)
  :config
  (setq projectile-project-root-functions
        '(projectile-root-top-down
          projectile-root-top-down-recurring
          projectile-root-local
          projectile-root-marked
          projectile-root-bottom-up))
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
  (use-package ibuffer-projectile
    :ensure t)
  )

(provide 'init-projectile)
;; init-projectile.el ends here
