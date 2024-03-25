;;; init-comint.el --- Initialize compilation buffer

;;; Commentary:
;;

(require 'ansi-color)

(defun colorize-compilation-buffer ()
  (ansi-color-apply-on-region compilation-filter-start (point)))
(add-hook 'compilation-filter-hook 'colorize-compilation-buffer)

(provide 'init-comint)

;;; init-comint.el ends here
