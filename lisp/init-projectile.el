;;; init-projectile.el --- Initialize projectile mode -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(use-package projectile
  :ensure t
  :hook
  (after-init . projectile-mode)
  :config
  (setq projectile-mode-line-prefix " Proj")
  (setq projectile-indexing-method 'native)
  (setq projectile-enable-caching 'persistent)
  (setq projectile-project-root-files-bottom-up
        (remove ".git" projectile-project-root-files-bottom-up))
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
  (use-package ibuffer-projectile
    :ensure t)
  )

(provide 'init-projectile)
;;; init-projectile.el ends here
