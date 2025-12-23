;;; init-projectile.el
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
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
  (use-package ibuffer-projectile
    :ensure t))

(provide 'init-projectile)
;; init-projectile.el ends here
