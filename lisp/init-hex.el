;;; init-hex.el --- Provide initialization to hex edit/view related functions

;;; Commentary:
;;

(require-package 'nhexl-mode)
(setq nhexl-line-width 16)
(setq nhexl-group-size 1)
(setq nhexl-hex-edit-mode t)

(provide 'init-hex)

;;; init-hex.el ends here
