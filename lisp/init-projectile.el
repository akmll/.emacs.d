;;; init-projectile.el
;;; Commentary:
;;; Code:

(require-package 'projectile)

(add-hook 'after-init-hook 'projectile-mode)

(setq-default projectile-mode-line-prefix " Proj")
(setq-default projectile-indexing-method 'alien)

(with-eval-after-load 'projectile
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map))

(require-package 'ibuffer-projectile)

(provide 'init-projectile)
;; init-projectile.el ends here
