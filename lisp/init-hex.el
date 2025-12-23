;;; init-hex.el --- Provide initialization to hex edit/view related functions

;;; Commentary:
;;

(use-package nhexl-mode
  :ensure t
  :custom
  (nhexl-line-width 16)
  (nhexl-group-size 1)
  (nhexl-hex-edit-mode t))

(provide 'init-hex)

;;; init-hex.el ends here
