;;; init-flycheck.el --- Provide flycheck error checker

;;; Commentary:
;;

(require-package 'flycheck)
(with-eval-after-load 'flycheck
  (diminish 'flycheck-mode))

(setq flycheck-checker-error-threshold nil)

(provide 'init-flycheck)

;;; init-flycheck.el ends here
