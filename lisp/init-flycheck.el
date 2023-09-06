;;; init-flycheck.el --- Provide flycheck error checker

;;; Commentary:
;;

(require-package 'flycheck)
(with-eval-after-load 'flycheck
  (diminish 'flycheck-mode)

  (setq flycheck-checker-error-threshold nil)
  (global-set-key (kbd "M-N") 'flycheck-next-error)
  (global-set-key (kbd "M-P") 'flycheck-previous-error))

(provide 'init-flycheck)

;;; init-flycheck.el ends here
